// ignore_for_file: cast_nullable_to_non_nullable
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TodoDTO extends _TodoDTO with RealmEntity, RealmObjectBase, RealmObject {
  TodoDTO(
    ObjectId id,
    String color,
    String time,
    String priority,
    String description,
    String title,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'priority', priority);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'title', title);
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
    ]);
  }
}
