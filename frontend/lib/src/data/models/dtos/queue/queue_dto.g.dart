// ignore_for_file: cast_nullable_to_non_nullable
// ignore_for_file: avoid_positional_boolean_parameters
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueDTO _$QueueDTOFromJson(Map<String, dynamic> json) => _QueueDTO()
  ..id = const ObjectIdConverter().fromJson(json['id'] as String)
  ..todoId = json['todoId'] as String
  ..operationType = json['operationType'] as String
  ..createdAt = json['createdAt'] as String
  ..lastSyncedAt = json['lastSyncedAt'] as String?;

Map<String, dynamic> _$QueueDTOToJson(_QueueDTO instance) => <String, dynamic>{
      'id': const ObjectIdConverter().toJson(instance.id),
      'todoId': instance.todoId,
      'operationType': instance.operationType,
      'createdAt': instance.createdAt,
      'lastSyncedAt': instance.lastSyncedAt,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class QueueDTO extends _QueueDTO
    with RealmEntity, RealmObjectBase, RealmObject {
  QueueDTO(
    ObjectId id,
    String todoId,
    String operationType,
    String createdAt, {
    String? lastSyncedAt,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'todoId', todoId);
    RealmObjectBase.set(this, 'operationType', operationType);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'lastSyncedAt', lastSyncedAt);
  }

  QueueDTO._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get todoId => RealmObjectBase.get<String>(this, 'todoId') as String;
  @override
  set todoId(String value) => throw RealmUnsupportedSetError();

  @override
  String get operationType =>
      RealmObjectBase.get<String>(this, 'operationType') as String;
  @override
  set operationType(String value) => throw RealmUnsupportedSetError();

  @override
  String get createdAt =>
      RealmObjectBase.get<String>(this, 'createdAt') as String;
  @override
  set createdAt(String value) => throw RealmUnsupportedSetError();

  @override
  String? get lastSyncedAt =>
      RealmObjectBase.get<String>(this, 'lastSyncedAt') as String?;
  @override
  set lastSyncedAt(String? value) =>
      RealmObjectBase.set(this, 'lastSyncedAt', value);

  @override
  Stream<RealmObjectChanges<QueueDTO>> get changes =>
      RealmObjectBase.getChanges<QueueDTO>(this);

  @override
  QueueDTO freeze() => RealmObjectBase.freezeObject<QueueDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(QueueDTO._);
    return const SchemaObject(ObjectType.realmObject, QueueDTO, 'QueueDTO', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('todoId', RealmPropertyType.string),
      SchemaProperty('operationType', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.string),
      SchemaProperty('lastSyncedAt', RealmPropertyType.string, optional: true),
    ]);
  }
}
