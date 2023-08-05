// ignore_for_file: cast_nullable_to_non_nullable
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO()
  ..uid = json['uid'] as String
  ..emailAddress = json['emailAddress'] as String
  ..firstName = json['firstName'] as String
  ..lastName = json['lastName'] as String;

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
      'uid': instance.uid,
      'emailAddress': instance.emailAddress,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserDTO extends _UserDTO with RealmEntity, RealmObjectBase, RealmObject {
  UserDTO(
    String uid,
    String emailAddress,
    String firstName,
    String lastName,
  ) {
    RealmObjectBase.set(this, 'uid', uid);
    RealmObjectBase.set(this, 'emailAddress', emailAddress);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
  }

  UserDTO._();

  @override
  String get uid => RealmObjectBase.get<String>(this, 'uid') as String;
  @override
  set uid(String value) => throw RealmUnsupportedSetError();

  @override
  String get emailAddress =>
      RealmObjectBase.get<String>(this, 'emailAddress') as String;
  @override
  set emailAddress(String value) => throw RealmUnsupportedSetError();

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => throw RealmUnsupportedSetError();

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<UserDTO>> get changes =>
      RealmObjectBase.getChanges<UserDTO>(this);

  @override
  UserDTO freeze() => RealmObjectBase.freezeObject<UserDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserDTO._);
    return const SchemaObject(ObjectType.realmObject, UserDTO, 'UserDTO', [
      SchemaProperty('uid', RealmPropertyType.string),
      SchemaProperty('emailAddress', RealmPropertyType.string),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
    ]);
  }
}
