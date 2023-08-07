import 'dart:developer' as developer;
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/queue/queue_api.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';

class LocalQueueApi extends QueueApi {
  LocalQueueApi({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<void> createQueue(QueueDTO queue) async {
    try {
      await _localStorage.create(queue);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> deleteQueue(String id) async {
    final queue = await getQueue(id);

    if (queue != null) {
      await _localStorage.delete<QueueDTO>(queue);
    }
  }

  @override
  Future<QueueDTO?> getQueue(String id) async {
    return _localStorage
        .read<QueueDTO>(r'id == $0', [ObjectId.fromHexString(id)]).firstOrNull;
  }

  @override
  Stream<List<QueueDTO>> getQueues() {
    return _localStorage
        .readAllAsStream<QueueDTO>()
        .map((event) => event.results.toList());
  }

  @override
  Future<void> updateQueue(void Function() callback) {
    // TODO: implement updateQueue
    throw UnimplementedError();
  }

  List<QueueDTO> fetchUnSyncedQueues() {
    return _localStorage.read<QueueDTO>(r'lastSyncedAt == $0', [null]).toList();
  }
}
