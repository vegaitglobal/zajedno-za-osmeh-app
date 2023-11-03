import 'dart:async';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gu_mobile/data/authentication/local/user_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'i_authentication_repository.dart';
import 'model/UserSession.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final GoTrueClient _authClient;
  final UserStorage _userStorage;
  final StreamController<UserSession> _sessionStream = StreamController();

  AuthenticationRepository(this._authClient, this._userStorage);

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _authClient.signUp(password: password, email: email);
  }

  @override
  Future<void> signUpWithVerification({
    required String name,
    required String lastname,
    required String email,
    required String password,
    required String filePath,
  }) async {
    await _sendEmail(name, lastname, email, filePath)
        .then((value) => signIn(password: password, email: email))
        .then((value) => _updateSessionState());
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    return await _authClient
        .signInWithPassword(password: password, email: email)
        .then((value) => _userStorage.saveToken(value.session?.accessToken))
        .then((value) => _updateSessionState());
  }

  @override
  Future<void> signOut() async {
    await _authClient.signOut();
    _updateSessionState();
  }

  @override
  Future<UserSession> getCurrentSession() async =>
      _mapAuthClientSessionToUserSession();

  Future<UserSession> _mapAuthClientSessionToUserSession() async =>
      _authClient.currentSession == null ? Unauthorized() : Authorized();

  @override
  StreamController<UserSession> observeSessionState() => _sessionStream;

  void _updateSessionState() async =>
      _sessionStream.sink.add(await _mapAuthClientSessionToUserSession());

  Future<void> _sendEmail(String name, String lastname, String senderMail, String filePath) async {
    final Email email = Email(
      body: 'Šalje: $senderMail',
      subject: 'Registracija korisnika',
      recipients: ['fondacijazajednozaosmeh@gmail.com'],
      attachmentPaths: [filePath],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _authClient.resetPasswordForEmail(email,
        redirectTo: 'io.supabase.zajednozaosmeh://login-callback/');
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    final userAttributes = UserAttributes(password: newPassword);
    await _authClient.updateUser(userAttributes);
  }

  @override
  Stream<AuthChangeEvent> getAuthStateChanges() {
    return _authClient.onAuthStateChange.map((event) {
      return event.event;
    });
  }


  @override
  Future<String> getCurrentUserId() {
    if(_authClient.currentUser == null){
      throw Exception();
    }
    return Future<String>.value(_authClient.currentUser?.id);
  }
}
