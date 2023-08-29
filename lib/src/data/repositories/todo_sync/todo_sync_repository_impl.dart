import 'dart:developer' as developer;

import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/queue/local_queue_api.dart';
import 'package:todo_bloc/src/data/api/queue/remote_queue_api.dart';
import 'package:todo_bloc/src/data/api/todo/local_todo_api.dart';
import 'package:todo_bloc/src/data/api/todo/remote_todo_api.dart';
import 'package:todo_bloc/src/data/models/domains/queue.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

class TodoSyncRepositoryImpl implements TodoSyncRepository {
  TodoSyncRepositoryImpl({
    required RemoteTodoApi remoteTodoApi,
    required LocalTodoApi localTodoApi,
    required RemoteQueueApi remoteQueueApi,
    required LocalQueueApi localQueueApi,
  })  : _remoteTodoApi = remoteTodoApi,
        _localTodoApi = localTodoApi,
        _remoteQueueApi = remoteQueueApi,
        _localQueueApi = localQueueApi;

  final RemoteTodoApi _remoteTodoApi;
  final LocalTodoApi _localTodoApi;
  final RemoteQueueApi _remoteQueueApi;
  final LocalQueueApi _localQueueApi;

  @override
  Future<void> needToPush() {
    return _pushSyncIfNeeded();
  }

  @override
  Future<void> needToPull() {
    return _pullSyncIfNeeded();
  }

  @override
  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) {
    return _storeQueueToSync(
      operationType: operationType,
      todoId: id,
    );
  }

  @override
  Stream<List<QueueObject>> getAllQueues() => _localQueueApi
      .getQueuesAsStream()
      .map((event) => event.map((e) => e.toPlainObject()).toList());

  /// MARK - PRIVATE

  Future<void> _storeQueueToSync({
    required QueueOperationType operationType,
    required String todoId,
  }) async {
    try {
      // If operation type is delete and todo_object hasn't been synced
      // yet then remove from queue and return
      if (operationType == QueueOperationType.delete) {
        final exists = await _localQueueApi.checkAndRemoveExistingUnsyncedQueue(
          operationType: operationType,
          todoId: todoId,
        );

        if (exists) return;
      }

      final newQueue = QueueDTO(
        ObjectId(),
        todoId,
        operationType.name,
        DateTime.now().toIso8601String(),
      );

      await _localQueueApi.createQueue(newQueue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  // TODO(demolaf): This functions are meant to be running in the background
  // This would be called by the timer which would then
  // fetch queues to be synced and push to db and also create the queue in the
  // doc ref
  Future<void> _pushUnSyncedQueuesAndTodosToRemote() async {
    // 1. Get the todo_id in the queue and fetch the todo_object from local
    // 2. Send the todo_object to remote
    // 3. Send the queue_object to remote
    // 4. Do I need to set syncedAt or something here?

    // TODO(demolaf): Check where un-synced queues

    try {
      // Query not synced queues
      final unSyncedQueues = _localQueueApi.fetchUnSyncedQueues();

      for (final unSyncedQueue in unSyncedQueues) {
        // Get todo_object on which operation is to be carried out

        switch (unSyncedQueue.operationType.toOperationType()) {
          case QueueOperationType.create:
            await _handlePushSyncForCreateOperation(unSyncedQueue);
          case QueueOperationType.update:
            await _handlePushSyncForUpdateOperation(unSyncedQueue);
          case QueueOperationType.delete:
            await _handlePushSyncForDeleteOperation(unSyncedQueue);
          case QueueOperationType.error:
            break;
        }
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePushSyncForDeleteOperation(QueueDTO unSyncedQueue) async {
    final now = DateTime.now().toIso8601String();

    try {
      await _remoteTodoApi.deleteTodo(unSyncedQueue.todoId);
      await _remoteQueueApi.createQueue(
        unSyncedQueue.copyWith(lastSyncedAt: now),
      );

      await _markQueueAsSynced(unSyncedQueue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePushSyncForUpdateOperation(QueueDTO unSyncedQueue) async {
    final now = DateTime.now().toIso8601String();

    try {
      final unSyncedTodo = await _localTodoApi.getTodo(unSyncedQueue.todoId);

      await _remoteTodoApi.updateTodo(unSyncedTodo!);
      await _remoteQueueApi.createQueue(
        unSyncedQueue.copyWith(lastSyncedAt: now),
      );

      await _markTodoAsSynced(unSyncedTodo);
      await _markQueueAsSynced(unSyncedQueue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePushSyncForCreateOperation(QueueDTO unSyncedQueue) async {
    final now = DateTime.now().toIso8601String();

    try {
      final unSyncedTodo = await _localTodoApi.getTodo(unSyncedQueue.todoId);

      if (unSyncedTodo != null) {
        await _remoteTodoApi.createTodo(unSyncedTodo.copyWith(synced: true));
        await _remoteQueueApi.createQueue(
          unSyncedQueue.copyWith(lastSyncedAt: now),
        );

        await _markTodoAsSynced(unSyncedTodo);
        await _markQueueAsSynced(unSyncedQueue);
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _pullQueuesAndTodosFromRemote() async {
    developer.log('Is pulling queues and todos from remote');

    final checked = <String, bool>{};

    try {
      final queuesInRemote = await _remoteQueueApi.getQueues();
      final queuesInLocal = await _localQueueApi.getQueues();

      if (queuesInRemote.isEmpty) {
        developer.log('No queues to pull');
        return;
      }

      for (final queue in queuesInLocal) {
        checked[queue.id.hexString] = false;
      }

      // developer.log('Queues in remote $queuesInRemote}');
      for (final queue in queuesInRemote) {
        // developer.log('Checking queue if need to pull $queue');
        // Check for queues not on local and store those queues on local

        developer.log(
          'Contains ${queue.id} ${!checked.containsKey(queue.id.hexString)}',
        );
        if (!checked.containsKey(queue.id.hexString)) {
          developer.log('Queue being pulled ${queue.id}');
          await _handlePull(queue: queue);
        }
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePull({required QueueDTO queue}) async {
    switch (queue.operationType.toOperationType()) {
      case QueueOperationType.create:
        await _handlePullSyncForCreate(queue);
      case QueueOperationType.update:
        await _handlePullSyncForUpdateOperation(queue);
      case QueueOperationType.delete:
        await _handlePullSyncForDeleteOperation(queue);
      case QueueOperationType.error:
        break;
    }
  }

  Future<void> _handlePullSyncForCreate(QueueDTO queue) async {
    // 1. Use the todo_id from the queue in remote
    // 2. Use the todo_id to fetch the todo_object in remote
    // 3. Store the todo_object in local
    // 4. Do I need to mark synced or something here?
    try {
      final todo = await _remoteTodoApi.getTodo(queue.todoId);

      if (todo != null) {
        developer.log('Found todo, creating & storing ${queue.todoId}');
        await _localTodoApi.createTodo(todo);
        await _localQueueApi.createQueue(queue);
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePullSyncForUpdateOperation(QueueDTO queue) async {
    try {
      final todoFromRemote = await _remoteTodoApi.getTodo(queue.todoId);

      if (todoFromRemote == null) {
        return;
      }

      final todoFromRemoteDate =
          DateTime.tryParse(todoFromRemote.lastModifiedAt);

      if (todoFromRemoteDate == null) {
        return;
      }

      final todoFromLocal =
          await _localTodoApi.getTodo(todoFromRemote.id.hexString);

      if (todoFromLocal == null) {
        return;
      }

      final todoFromLocalDate = DateTime.tryParse(todoFromLocal.lastModifiedAt);

      if (todoFromLocalDate == null) {
        return;
      }

      if (todoFromRemoteDate.isAfter(todoFromLocalDate)) {
        developer.log('Found todo, updating & storing ${queue.todoId}');
        // update todo_object in local because the one in local is outdated
        await _localTodoApi.updateTodo(todoFromRemote);
      }

      await _localQueueApi.createQueue(queue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePullSyncForDeleteOperation(QueueDTO queue) async {
    // 1. Use the todo_id from the queue in remote
    // 2. Use the todo_id to fetch the todo_object in remote
    // 3. Delete the todo_object in local
    // 4. Do I need to mark synced or something here?

    try {
      developer.log('Found todo, deleting ${queue.todoId}');
      await _localTodoApi.deleteTodo(queue.todoId);
      await _localQueueApi.createQueue(queue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _markQueueAsSynced(QueueDTO queue) async {
    final now = DateTime.now().toIso8601String();

    try {
      await _localQueueApi.updateQueue(() {
        queue.lastSyncedAt = now;
      });
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  // TODO(demolaf): ensure this works the idea is to show synced state in ui
  // if todo_object was modified you have to mark it as unsynced
  // until pushed
  // if todo_object was created you have to mark it as synced after push
  Future<void> _markTodoAsSynced(TodoDTO todo) async {
    try {
      await _localTodoApi.updateTodoLocal(() {
        todo.synced = true;
      });
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  /// Check if need to sync queues
  Future<void> _pushSyncIfNeeded() async {
    try {
      final results = _localQueueApi.fetchUnSyncedQueues();
      developer.log('Results from synced query $results, '
          'needs to sync: ${results.isNotEmpty}');

      if (results.isNotEmpty) {
        await _pushUnSyncedQueuesAndTodosToRemote();
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  /// We listen here because we're using firebase and it lets us know through
  /// a stream subscription that a change has been made in queues doc
  ///
  /// In a REST API we would need use another method
  /// 1. Web hooks
  /// 2.
  Future<void> _pullSyncIfNeeded() async {
    try {
      await _pullQueuesAndTodosFromRemote();
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
