import 'dart:async';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gu_mobile/data/authentication/local/user_storage.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'i_authentication_repository.dart';
import 'model/UserSession.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final GoTrueClient _authClient;
  final UserStorage _userStorage;
  final StreamController<UserSession> _sessionStream = StreamController();
  StreamController<AuthState> _authStateController =
      StreamController<AuthState>();

  AuthenticationRepository(this._authClient, this._userStorage);

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _authClient.signUp(password: password, email: email);
  }

  @override
  Future<void> signUpWithVerification(
      {required String email,
      required String password,
      required String filePath}) async {
    await _sendEmail(email, filePath)
        .then((value) => signUp(email: email, password: password))
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

  Future<void> _sendEmail(String sender, String filePath) async {
    final Email email = Email(
      body: 'Šalje: $sender',
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

  // @override
  // Stream<AuthState> getAuthStateChanges() {
  //   _authClient.onAuthStateChange.listen((event) {
  //     event.event;
  //   });
  // }
  @override
  Stream<AuthState> getAuthStateChanges() {
    return _authStateController.stream;
  }

  // Whenever the authentication state changes, call this method to add an event to the stream.
  void onAuthStateChanged(AuthState state) {
    _authStateController.add(state);
  }
}
