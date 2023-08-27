import 'package:todo_bloc/src/data/api/queue_service.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

class TodoSyncRepositoryImpl implements TodoSyncRepository {
  TodoSyncRepositoryImpl({
    required QueueService queueService,
  }) : _queueService = queueService;

  final QueueService _queueService;

  @override
  Future<void> needToPush() {
    return _queueService.pushSyncIfNeeded();
  }

  @override
  Future<void> needToPull() {
    return _queueService.pullSyncIfNeeded();
  }

  @override
  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  }) {
    return _queueService.storeQueueToSync(
      operationType: operationType,
      todoId: id,
    );
  }
}
