import 'dart:developer' as developer;
import 'package:apis/apis.dart';
import 'package:realm/realm.dart';
import 'package:repositories/src/todo_sync/todo_sync_repository.dart';

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
  Future<void> needToPush() async {
    try {
      await _pushUnSyncedQueuesAndTodosToRemote();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> needToPull() async {
    try {
      await _pullQueuesAndTodosFromRemote();
    } catch (e) {
      developer.log(e.toString());
    }
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

  Future<void> _pushUnSyncedQueuesAndTodosToRemote() async {
    try {
      final unSyncedQueues = _localQueueApi.fetchUnSyncedQueues();

      if (unSyncedQueues.isEmpty) return;

      for (final unSyncedQueue in unSyncedQueues) {
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

      if (unSyncedTodo == null) return;

      await _remoteTodoApi.createTodo(unSyncedTodo.copyWith(synced: true));
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

  Future<void> _pullQueuesAndTodosFromRemote() async {
    developer.log('Is pulling queues and todos from remote');

    final syncedQueues = <String, bool>{};

    try {
      final queuesInRemote = await _remoteQueueApi.getQueues();

      if (queuesInRemote.isEmpty) return;

      final queuesInLocal = await _localQueueApi.getQueues();

      for (final queue in queuesInLocal) {
        syncedQueues[queue.id.hexString] = true;
      }

      for (final queue in queuesInRemote) {
        developer.log(
          'Contains'
          ' ${queue.id} ${!syncedQueues.containsKey(queue.id.hexString)}',
        );

        if (syncedQueues.containsKey(queue.id.hexString)) return;

        developer.log('Queue being pulled ${queue.id}');
        await _handlePull(queue: queue);
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
    try {
      final todo = await _remoteTodoApi.getTodo(queue.todoId);

      if (todo == null) return;

      developer.log('Found todo, creating & storing ${queue.todoId}');
      await _localTodoApi.createTodo(todo);
      await _localQueueApi.createQueue(queue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePullSyncForUpdateOperation(QueueDTO queue) async {
    try {
      final todoFromRemote = await _remoteTodoApi.getTodo(queue.todoId);

      if (todoFromRemote == null) return;

      final todoFromRemoteDate =
          DateTime.tryParse(todoFromRemote.lastModifiedAt);

      if (todoFromRemoteDate == null) return;

      final todoFromLocal =
          await _localTodoApi.getTodo(todoFromRemote.id.hexString);

      if (todoFromLocal == null) return;

      final todoFromLocalDate = DateTime.tryParse(todoFromLocal.lastModifiedAt);

      if (todoFromLocalDate == null) return;

      if (todoFromRemoteDate.isAfter(todoFromLocalDate)) {
        developer.log('Found todo, updating & storing ${queue.todoId}');
        await _localTodoApi.updateTodo(todoFromRemote);
        await _markTodoAsSynced(todoFromRemote);
      }

      await _localQueueApi.createQueue(queue);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _handlePullSyncForDeleteOperation(QueueDTO queue) async {
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
      await _localQueueApi.updateQueueProperty(() {
        queue.lastSyncedAt = now;
      });
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> _markTodoAsSynced(TodoDTO todo) async {
    try {
      await _localTodoApi.updateTodoProperty(() {
        todo.synced = true;
      });
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }
}
