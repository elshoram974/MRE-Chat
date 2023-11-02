abstract class AuthRepositories {
  Future<void> loginWithEmail();
  Future<void> loginWithGoogle();
  Future<void> signUp();
  Future<void> getUserUid();
}
