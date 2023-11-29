abstract class AuthRepository {
  Future<void> signIn();

  Future<void> signOut();

  Future<bool> checkIfUserAuthenticated();
}
