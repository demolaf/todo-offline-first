import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_bloc/src/data/api/queue/queue_api.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';

class RemoteQueueApi extends QueueApi {
  RemoteQueueApi({
    required String userId,
    required FirebaseFirestore firestore,
  })  : _userId = userId,
        _queuesRef = firestore.collection('queues');

  final String _userId;
  final CollectionReference _queuesRef;

  @override
  Future<void> createQueue(QueueDTO queue) async {
    final docRef = _getUserQueuesDocRef();

    final queuesInRemote = await getQueues().first;

    final queueToSyncJson = [
      ...queuesInRemote.map((e) => e.toJson()),
      queue.toJson(),
    ];

    await docRef.set({'queues': queueToSyncJson});
  }

  @override
  Future<void> deleteQueue(String id) {
    // TODO: implement deleteQueue
    throw UnimplementedError();
  }

  @override
  Future<QueueDTO?> getQueue(String id) {
    // TODO: implement getQueue
    throw UnimplementedError();
  }

  @override
  Stream<List<QueueDTO>> getQueues() {
    final docRef = _getUserQueuesDocRef();

    return docRef.snapshots().asyncMap((event) {
      final queuesResponse = event.data() as Map<String, dynamic>?;

      if (queuesResponse != null) {
        final queues = queuesResponse['queues'] as List<dynamic>;
        return queues
            .map((e) => QueueDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <QueueDTO>[];
    });
  }

  @override
  Future<void> updateQueue(void Function() callback) {
    // TODO: implement updateQueue
    throw UnimplementedError();
  }

  DocumentReference<Object?> _getUserQueuesDocRef() {
    return _queuesRef.doc(_userId);
  }
}
