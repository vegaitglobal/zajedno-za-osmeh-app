import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gu_mobile/data/authentication/local/user_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'i_authentication_repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final GoTrueClient _authClient;
  final UserStorage _userStorage;

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
    await signUp(email: email, password: password)
        .then((value) => _sendEmail(email, filePath));
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    return await _authClient
        .signInWithPassword(password: password, email: email)
        .then((value) => _userStorage.saveToken(value.session?.accessToken));
  }

  @override
  Future<void> signOut() async {
    await _authClient.signOut();
  }

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
}
