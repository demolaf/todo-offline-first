// ignore_for_file: unused_field
import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/models/user/user_dto.dart';

class UserApi {
  UserApi({
    required LocalStorage localStorage,
  })  : _userRef = FirebaseFirestore.instance.collection('users'),
        _localStorage = localStorage;

  final LocalStorage _localStorage;
  final CollectionReference _userRef;

  Future<UserDTO?> getUserDoc(UserDTO? user) async {
    UserDTO? userDTO;

    try {
      userDTO = await _userRef.doc(user?.uid).get().then(
            (doc) => UserDTOJsonParser.fromJson(
              doc.data()! as Map<String, dynamic>,
            ),
          );
    } catch (_) {
      developer.log('createNewUserRemote HERE: $userDTO');
      userDTO = await createNewUserRemote(
        uid: user!.uid,
        firstName: user.firstName,
        lastName: user.lastName,
        emailAddress: user.emailAddress,
      );
    }

    return userDTO;
  }

  Future<UserDTO> createNewUserRemote({
    required String uid,
    required String firstName,
    required String lastName,
    required String emailAddress,
  }) async {
    final newUser = UserDTO(
      uid,
      emailAddress,
      firstName,
      lastName,
    );
    await _userRef.doc(uid).set(newUser.toJson()).then((_) => newUser);

    return newUser;
  }

  Future<void> storeUserToDB(UserDTO user) async => _localStorage.create(user);

  /// Using realm object with an object id will guarantee the object is always
  /// replaced therefore fetching the stored authenticated user with the
  /// "readAll" method would always return a single object
  UserDTO? getAuthUserFromDB() {
    try {
      return _localStorage.readAll<UserDTO>().first;
    } catch (e) {
      return null;
    }
  }

  /// Using realm object with an object id will guarantee the object is always
  /// replaced therefore deleting all in this case means we are deleting the
  /// only stored authenticated user in db
  Future<void> deleteAuthUser() async {
    await _localStorage.deleteAll<UserDTO>();
    await _localStorage.deleteAll<TodoDTO>();
  }
}
