import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';

abstract class TodoSyncRepository {
  Future<void> needToPush();

  Future<void> needToPull();

  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  });
}
