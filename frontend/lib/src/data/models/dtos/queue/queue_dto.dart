import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/models/domains/queue.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';

part 'queue_dto.g.dart';

enum QueueOperationType {
  create,
  update,
  delete,
  error,
}

extension ParseQueueOperationType on String {
  QueueOperationType toOperationType() {
    switch (this) {
      case 'create':
        return QueueOperationType.create;
      case 'update':
        return QueueOperationType.update;
      case 'delete':
        return QueueOperationType.delete;
      default:
        return QueueOperationType.error;
    }
  }
}

extension QueueDTOJsonParser on QueueDTO {
  QueueObject toPlainObject() {
    return QueueObject(
      id: id,
      todoId: todoId,
      createdAt: createdAt,
      lastSyncedAt: lastSyncedAt,
      operationType: operationType,
    );
  }

  static QueueDTO _toRealmObject(_QueueDTO queue) {
    return QueueDTO(
      queue.id,
      queue.todoId,
      queue.operationType,
      queue.createdAt,
      lastSyncedAt: queue.lastSyncedAt,
    );
  }

  static QueueDTO fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$QueueDTOFromJson(json));

  Map<String, dynamic> toJson() => _$QueueDTOToJson(this);

  QueueDTO copyWith({
    String? todoId,
    String? operationType,
    String? createdAt,
    String? lastSyncedAt,
  }) {
    return QueueDTO(
      id,
      todoId ?? this.todoId,
      operationType ?? this.operationType,
      createdAt ?? this.createdAt,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}

/// This object would be used to store changes made to a todo_object
/// 1. It will have it's own id
/// 2. It will have the id of the todo_object
/// 3. It will have the operation type to be carried out on the todo_object
/// 4. It will have the todo_object or maybe use generics
/// 5. It will contain a creation Date which will be used to check if the
/// todo_object being modified or deleted is older than the todo_object last
/// updated date
/// 6. It will also contain last syncedAt Date which would be stored in the
/// local db to compare against the remote db, the remote db will also
/// have the last SyncedAt Date
///

@RealmModel()
@JsonSerializable()
@ObjectIdConverter()
class _QueueDTO {
  @PrimaryKey()
  late ObjectId id;
  late final String todoId;
  late final String operationType;
  late final String createdAt;
  String? lastSyncedAt;

  @override
  String toString() {
    return '_QueueDTO{id: $id, todoId: $todoId, operationType: $operationType,'
        ' createdAt: $createdAt, lastSyncedAt: $lastSyncedAt}';
  }
}
