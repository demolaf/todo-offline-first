import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/user/user_dto.dart';

/// Does this mean I'm creating a backend in the application? wow!
class QueueApi {
  QueueApi({
    required LocalStorage localStorage,
  })  : _localStorage = localStorage,
        _queuesRef = (FirebaseFirestore.instance
              ..settings = const Settings(persistenceEnabled: false))
            .collection('queues'),
        _todosRef = (FirebaseFirestore.instance
              ..settings = const Settings(persistenceEnabled: false))
            .collection('todos');

  final LocalStorage _localStorage;
  final CollectionReference _queuesRef;
  final CollectionReference _todosRef;

  Future<void> storeQueueToSync({
    required QueueOperationType operationType,
    required String todoId,
  }) async {
    try {
      if (operationType == QueueOperationType.delete) {
        // If operation type is delete and todo_object hasn't been synced
        // yet then remove from queue and return
        final todo = getTodo(ObjectId.fromHexString(todoId));

        final unSyncedQueues = _fetchUnSyncedQueues();

        final matchingQueues = unSyncedQueues
            .where((element) => element.todoId == todo.id.hexString);

        if (matchingQueues.isNotEmpty) {
          await _localStorage.delete(matchingQueues.first);
          return;
        }
      }

      final newQueue = QueueDTO(
        ObjectId(),
        todoId,
        operationType.name,
        DateTime.now().toIso8601String(),
      );

      await _localStorage.create(newQueue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  // TODO(demolaf): This functions are meant to be running in the background
  // This would be called by the timer which would then
  // fetch queues to be synced and push to db and also create the queue in the
  // doc ref
  Future<void> pushUnSyncedQueuesAndTodosToRemote() async {
    // 1. Get the todo_id in the queue and fetch the todo_object from local
    // 2. Send the todo_object to remote
    // 3. Send the queue_object to remote
    // 4. Do I need to set syncedAt or something here?

    // TODO(demolaf): Check where un-synced queues

    // Query not synced queues
    final unSyncedQueues = _fetchUnSyncedQueues();

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
  }

  Future<void> _handlePushSyncForDeleteOperation(QueueDTO unSyncedQueue) async {
    final now = DateTime.now().toIso8601String();

    try {
      await _deleteTodoInRemote(id: unSyncedQueue.todoId);
      await _createQueueToRemote(
        queue: unSyncedQueue.copyWith(lastSyncedAt: now),
      );

      await markQueueAsSynced(unSyncedQueue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> _handlePushSyncForUpdateOperation(QueueDTO unSyncedQueue) async {
    try {
      final todo = getTodo(ObjectId.fromHexString(unSyncedQueue.todoId));

      await _updateTodoInRemote(todo: todo);
      await _updateQueueInRemote(queue: unSyncedQueue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> _handlePushSyncForCreateOperation(QueueDTO unSyncedQueue) async {
    final now = DateTime.now().toIso8601String();

    try {
      final todo = getTodo(ObjectId.fromHexString(unSyncedQueue.todoId));

      await _createTodoToRemote(todo: todo.copyWith(synced: true));
      await _createQueueToRemote(
        queue: unSyncedQueue.copyWith(lastSyncedAt: now),
      );

      await markQueueAsSynced(unSyncedQueue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> pullQueuesAndTodosFromRemote() async {
    developer.log('Is pulling queues and todos from remote');

    final checked = <String, bool>{};

    final queuesInRemote = await _fetchQueuesInRemote();
    final queuesInLocal = _fetchQueuesInLocal();

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
      await _createTodoInLocal(todoId: queue.todoId);
      await _createQueueInLocal(queue: queue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> _handlePullSyncForUpdateOperation(QueueDTO queue) async {
    // 1. Use the todo_id from the queue in remote
    // 2. Use the todo_id to fetch the todo_object in remote
    // 3. Update the todo_object in local
    // 4. Do I need to mark synced or something here?

    try {
      await _updateTodoInLocal(todoId: '');
      await _createQueueInLocal(queue: queue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> _handlePullSyncForDeleteOperation(QueueDTO queue) async {
    // 1. Use the todo_id from the queue in remote
    // 2. Use the todo_id to fetch the todo_object in remote
    // 3. Delete the todo_object in local
    // 4. Do I need to mark synced or something here?

    try {
      await _deleteTodoInLocal(todoId: queue.todoId);
      await _createQueueInLocal(queue: queue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> markQueueAsSynced(QueueDTO queue) async {
    final now = DateTime.now().toIso8601String();

    await _localStorage.update<QueueDTO>(() {
      queue.lastSyncedAt = now;
    });
  }

  /// Check if need to sync queues
  bool checkIfNeedToPushSync() {
    final results = _fetchUnSyncedQueues();
    developer.log('Results from synced query $results, '
        'needs to sync: ${results.isNotEmpty}');
    return results.isNotEmpty;
  }

  /// Fetch un-synced queues from local
  List<QueueDTO> _fetchUnSyncedQueues() {
    // TODO(demolaf): am I meant to check for remote here too?
    return _localStorage.read<QueueDTO>(r'lastSyncedAt == $0', [null]).toList();
  }

  TodoDTO getTodo(ObjectId id) {
    return _localStorage.read<TodoDTO>(r'id == $0', [id]).first;
  }

  /// MARK: PRIVATE METHODS

  /// MARK: TODO_OBJECT LOCAL OPERATIONS

  List<QueueDTO> _fetchQueuesInLocal() {
    return _localStorage.readAll<QueueDTO>().toList();
  }

  Future<void> _createTodoInLocal({required String todoId}) async {
    developer.log('Is getting todo to be created');
    final todos = await _fetchTodosInRemoteFuture();

    final todoToBeCreatedAndAddedToLocal = todos.firstWhereOrNull(
      (element) => element.id.hexString == todoId,
    );

    developer.log('Found todo $todos $todoId $todoToBeCreatedAndAddedToLocal');

    if (todoToBeCreatedAndAddedToLocal != null) {
      developer.log('Is Creating todo $todoToBeCreatedAndAddedToLocal');
      await _localStorage.create<TodoDTO>(todoToBeCreatedAndAddedToLocal);
    }
  }

  Future<void> _updateTodoInLocal({required String todoId}) async {}

  Future<void> _deleteTodoInLocal({required String todoId}) async {
    final todoToBeDeletedFromLocal =
        _localStorage.findObjectById<TodoDTO>(ObjectId.fromHexString(todoId));

    developer.log('Problem $todoToBeDeletedFromLocal, here $todoId');

    if (todoToBeDeletedFromLocal != null) {
      await _localStorage.delete(todoToBeDeletedFromLocal);
    }
  }

  /// MARK: QUEUE_OBJECT LOCAL OPERATIONS

  Future<void> _createQueueInLocal({required QueueDTO queue}) async {
    await _localStorage.create<QueueDTO>(queue);
  }

  // Future<void> _updateQueueInLocal({required String queueId}) async {}

  // Future<void> _deleteQueueInLocal({required QueueDTO queue}) async {}

  /// MARK: TODO_OBJECT REMOTE OPERATIONS

  Future<List<TodoDTO>> _fetchTodosInRemoteFuture() async {
    final docRef = _getUserTodosDocRef();

    return docRef.get().then((value) {
      final todosResponse = value.data() as Map<String, dynamic>?;

      if (todosResponse != null) {
        final todos = todosResponse['todos'] as List<dynamic>;
        return todos
            .map((e) => TodoDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <TodoDTO>[];
    });
  }

  Future<List<TodoDTO>> _fetchTodosInRemote() async {
    final docRef = _getUserTodosDocRef();

    return docRef.get().then((value) {
      final todosResponse = value.data() as Map<String, dynamic>?;

      if (todosResponse != null) {
        final todos = todosResponse['todos'] as List<dynamic>;
        return todos
            .map((e) => TodoDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <TodoDTO>[];
    });
  }

  Future<void> _createTodoToRemote({required TodoDTO todo}) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _fetchTodosInRemote();

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
      todo.toJson(),
    ];

    await docRef.set({'todos': todosToSyncJson});
  }

  Future<void> _updateTodoInRemote({required TodoDTO todo}) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _fetchTodosInRemote();

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
      todo.toJson(),
    ];

    await docRef.set({'todos': todosToSyncJson});
  }

  Future<void> _deleteTodoInRemote({required String id}) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _fetchTodosInRemote();

    todosInRemote.removeWhere((element) => element.id.hexString == id);

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson())
    ];

    await docRef.update({'todos': todosToSyncJson});
  }

  /// MARK: QUEUE_OBJECT REMOTE OPERATIONS

  void pullWhen() {
    final docRef = _getUserQueuesDocRef();

    docRef.snapshots().listen((event) async {
      await pullQueuesAndTodosFromRemote();
    });
  }

  Future<List<QueueDTO>> _fetchQueuesInRemote() {
    final docRef = _getUserQueuesDocRef();

    return docRef.get().then((value) {
      final queuesResponse = value.data() as Map<String, dynamic>?;

      if (queuesResponse != null) {
        final queues = queuesResponse['queues'] as List<dynamic>;
        return queues
            .map((e) => QueueDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <QueueDTO>[];
    });
  }

  Future<void> _createQueueToRemote({required QueueDTO queue}) async {
    final docRef = _getUserQueuesDocRef();

    final queuesInRemote = await _fetchQueuesInRemote();

    final queueToSyncJson = [
      ...queuesInRemote.map((e) => e.toJson()),
      queue.toJson(),
    ];

    await docRef.set({'queues': queueToSyncJson});
  }

  Future<void> _updateQueueInRemote({required QueueDTO queue}) async {
    final docRef = _getUserQueuesDocRef();

    final queuesInRemote = await _fetchQueuesInRemote();

    final queueToSyncJson = [
      ...queuesInRemote.map((e) => e.toJson()),
      queue.toJson(),
    ];

    await docRef.set({'queues': queueToSyncJson});
  }

  // Future<void> _deleteQueueInRemote({required QueueDTO queue}) async {
  //   final docRef = _getUserQueuesDocRef();
  //
  //   final queuesInRemote = await _fetchQueuesInRemote();
  //
  //   final queueToSyncJson = [
  //     ...queuesInRemote.map((e) => e.toJson()),
  //     queue.toJson(),
  //   ];
  //
  //   await docRef.set({'queues': queueToSyncJson});
  // }

  /// DOC REF SPECIFIC METHODS

  DocumentReference<Object?> _getUserQueuesDocRef() {
    final user = _localStorage.readAll<UserDTO>().first;

    return _queuesRef.doc(user.uid);
  }

  DocumentReference<Object?> _getUserTodosDocRef() {
    final user = _localStorage.readAll<UserDTO>().first;

    return _todosRef.doc(user.uid);
  }
}
