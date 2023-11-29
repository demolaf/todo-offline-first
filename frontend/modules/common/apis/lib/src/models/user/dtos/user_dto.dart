import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';

part 'user_dto.g.dart';

extension UserDTOJsonParser on UserDTO {
  static UserDTO _toRealmObject(_UserDTO user) {
    return UserDTO(
      user.uid,
      user.emailAddress,
      user.firstName,
      user.lastName,
    );
  }

  static UserDTO fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$UserDTOFromJson(json));

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

@RealmModel()
@JsonSerializable()
class _UserDTO {
  late final String uid;
  late final String emailAddress;
  late final String firstName;
  late final String lastName;

  @override
  String toString() {
    return '_UserDTO{uid: $uid, emailAddress: $emailAddress,'
        ' firstName: $firstName, lastName: $lastName}';
  }
}
