import 'package:apis/src/apis/queue/queue_api.dart';
import 'package:apis/src/models/queue/dto/queue_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    final queuesInRemote = await getQueues();

    final queueToSyncJson = [
      ...queuesInRemote.map((e) => e.toJson()),
      queue.toJson(),
    ];

    await docRef.set({'queues': queueToSyncJson});
  }

  @override
  Future<void> deleteQueue(String id) {
    // TODO(demolaf): implement deleteQueue
    throw UnimplementedError();
  }

  @override
  Future<QueueDTO?> getQueue(String id) {
    // TODO(demolaf): implement getQueue
    throw UnimplementedError();
  }

  @override
  Future<List<QueueDTO>> getQueues() {
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

  @override
  Stream<List<QueueDTO>> getQueuesAsStream() {
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
  Future<void> updateQueueProperty(void Function() callback) {
    // TODO(demolaf): implement updateQueue
    throw UnimplementedError();
  }

  DocumentReference<Object?> _getUserQueuesDocRef() {
    return _queuesRef.doc(_userId);
  }
}
