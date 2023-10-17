
abstract class IAuthenticationRepository {
  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> signUpWithVerification({
    required String email,
    required String password,
    required String filePath,
  });

  Future<void> signOut();
}
