// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoDTO _$TodoDTOFromJson(Map<String, dynamic> json) => _TodoDTO()
  ..id = const ObjectIdConverter().fromJson(json['id'] as String)
  ..color = json['color'] as String
  ..time = json['time'] as String
  ..priority = json['priority'] as String
  ..description = json['description'] as String
  ..title = json['title'] as String
  ..lastModifiedAt = json['lastModifiedAt'] as String
  ..synced = json['synced'] as bool
  ..completed = json['completed'] as bool;

Map<String, dynamic> _$TodoDTOToJson(_TodoDTO instance) => <String, dynamic>{
      'id': const ObjectIdConverter().toJson(instance.id),
      'color': instance.color,
      'time': instance.time,
      'priority': instance.priority,
      'description': instance.description,
      'title': instance.title,
      'lastModifiedAt': instance.lastModifiedAt,
      'synced': instance.synced,
      'completed': instance.completed,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TodoDTO extends _TodoDTO with RealmEntity, RealmObjectBase, RealmObject {
  TodoDTO(
    ObjectId id,
    String color,
    String time,
    String priority,
    String description,
    String title,
    String lastModifiedAt,
    bool synced,
    bool completed,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'priority', priority);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'lastModifiedAt', lastModifiedAt);
    RealmObjectBase.set(this, 'synced', synced);
    RealmObjectBase.set(this, 'completed', completed);
  }

  TodoDTO._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get color => RealmObjectBase.get<String>(this, 'color') as String;
  @override
  set color(String value) => throw RealmUnsupportedSetError();

  @override
  String get time => RealmObjectBase.get<String>(this, 'time') as String;
  @override
  set time(String value) => throw RealmUnsupportedSetError();

  @override
  String get priority =>
      RealmObjectBase.get<String>(this, 'priority') as String;
  @override
  set priority(String value) => throw RealmUnsupportedSetError();

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  String get lastModifiedAt =>
      RealmObjectBase.get<String>(this, 'lastModifiedAt') as String;
  @override
  set lastModifiedAt(String value) => throw RealmUnsupportedSetError();

  @override
  bool get synced => RealmObjectBase.get<bool>(this, 'synced') as bool;
  @override
  set synced(bool value) => RealmObjectBase.set(this, 'synced', value);

  @override
  bool get completed => RealmObjectBase.get<bool>(this, 'completed') as bool;
  @override
  set completed(bool value) => RealmObjectBase.set(this, 'completed', value);

  @override
  Stream<RealmObjectChanges<TodoDTO>> get changes =>
      RealmObjectBase.getChanges<TodoDTO>(this);

  @override
  TodoDTO freeze() => RealmObjectBase.freezeObject<TodoDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TodoDTO._);
    return const SchemaObject(ObjectType.realmObject, TodoDTO, 'TodoDTO', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('color', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.string),
      SchemaProperty('priority', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('lastModifiedAt', RealmPropertyType.string),
      SchemaProperty('synced', RealmPropertyType.bool),
      SchemaProperty('completed', RealmPropertyType.bool),
    ]);
  }
}
