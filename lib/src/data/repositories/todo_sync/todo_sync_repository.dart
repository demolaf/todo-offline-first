import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';

abstract class TodoSyncRepository {
  bool needToPushSync();

  void listenForPullSync();

  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  });

  Future<void> syncTodosWithRemote();

  Future<void> createDeleteQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  });
}
