import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';

abstract class QueueApi {
  Future<QueueDTO?> getQueue(String id);

  Stream<List<QueueDTO>> getQueues();

  Future<void> createQueue(QueueDTO queue);

  Future<void> updateQueue(void Function() callback);

  Future<void> deleteQueue(String id);
}
