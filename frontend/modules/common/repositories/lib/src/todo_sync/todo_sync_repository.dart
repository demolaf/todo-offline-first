import 'package:apis/apis.dart';

abstract class TodoSyncRepository {
  Future<void> needToPush();

  Future<void> needToPull();

  Future<void> createQueueForTodo({
    required QueueOperationType operationType,
    required String id,
  });

  Stream<List<QueueObject>> getAllQueues();
}
