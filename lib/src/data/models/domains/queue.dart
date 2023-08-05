import 'package:realm/realm.dart';

class QueueObject {
  QueueObject({
    required this.id,
    required this.todoId,
    required this.operationType,
    required this.createdAt,
    this.lastSyncedAt,
  });

  final ObjectId id;
  final String todoId;
  final String operationType;
  final String createdAt;
  final String? lastSyncedAt;

  @override
  String toString() {
    return 'QueueObject{id: $id, todoId: $todoId, operationType:'
        ' $operationType, createdAt: $createdAt, lastSyncedAt: $lastSyncedAt}';
  }
}
