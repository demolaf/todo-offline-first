import 'package:todo_bloc/src/data/api/queue_service.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

class TodoSyncRepositoryImpl implements TodoSyncRepository {
  TodoSyncRepositoryImpl({
    required QueueService queueService,
  }) : _queueService = queueService;

  final QueueService _queueService;

  @override
  bool needToPushSync() => _queueService.checkIfNeedToPushSync();

  @override
  void listenForPullSync() {
    _queueService.listenForChangesInQueuesDoc();
  }

  @override
  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) =>
      _queueService.storeQueueToSync(
        operationType: QueueOperationType.create,
        todoId: id,
      );

  @override
  Future<void> syncTodosWithRemote() =>
      _queueService.pushUnSyncedQueuesAndTodosToRemote();

  @override
  Future<void> createDeleteQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) =>
      _queueService.storeQueueToSync(operationType: operationType, todoId: id);
}
