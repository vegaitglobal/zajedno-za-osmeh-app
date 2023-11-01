
import 'dart:async';

import 'model/UserSession.dart';

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
    required String name,
    required String lastname,
    required String email,
    required String password,
    required String filePath,
  });

  Future<void> signOut();

  Future<UserSession> getCurrentSession();

  StreamController<UserSession> observeSessionState();

  Future<String> getCurrentUserId();

}
