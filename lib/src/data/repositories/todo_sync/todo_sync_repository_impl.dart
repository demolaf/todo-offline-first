import 'package:todo_bloc/src/data/api/queue_api.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

class TodoSyncRepositoryImpl implements TodoSyncRepository {
  TodoSyncRepositoryImpl({
    required QueueApi queueApi,
  }) : _queueApi = queueApi;

  final QueueApi _queueApi;

  @override
  bool needToPushSync() => _queueApi.checkIfNeedToPushSync();

  @override
  void listenForPullSync() {
    _queueApi.pullWhen();
  }

  @override
  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) =>
      _queueApi.storeQueueToSync(
        operationType: QueueOperationType.create,
        todoId: id,
      );

  @override
  Future<void> syncTodosWithRemote() =>
      _queueApi.pushUnSyncedQueuesAndTodosToRemote();

  @override
  Future<void> createDeleteQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) =>
      _queueApi.storeQueueToSync(operationType: operationType, todoId: id);
}
