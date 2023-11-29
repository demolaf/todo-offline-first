import 'package:apis/src/models/queue/dto/queue_dto.dart';

abstract class QueueApi {
  Future<QueueDTO?> getQueue(String id);

  Future<List<QueueDTO>> getQueues();

  Stream<List<QueueDTO>> getQueuesAsStream();

  Future<void> createQueue(QueueDTO queue);

  Future<void> updateQueueProperty(void Function() callback);

  Future<void> deleteQueue(String id);
}
