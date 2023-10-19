import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_bloc/src/data/api/user_api.dart';
import 'package:todo_bloc/src/data/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required UserApi userApi,
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _userApi = userApi,
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final UserApi _userApi;

  @override
  Future<bool> checkIfUserAuthenticated() async {
    final user = _userApi.getAuthUserFromDB();
    return user != null;
  }

  @override
  Future<void> signIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final firstName = userCredential.user?.displayName?.split(' ')[0];
      final lastName = userCredential.user?.displayName?.split(' ')[1];

      final newUser = await _userApi.createNewUserRemote(
        uid: userCredential.user!.uid,
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        emailAddress: userCredential.user?.email ?? '',
      );

      await _userApi.storeUserToDB(newUser);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _userApi.deleteAuthUser();
    await _firebaseAuth.signOut();
  }
}
