import 'dart:convert';

import 'package:gu_mobile/data/authentication/local/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorageImpl implements UserStorage {
  final SharedPreferences _prefs;

  UserStorageImpl(this._prefs);

  final String _key = 'token_key';

  @override
  String? getToken() {
    return _prefs.getString(_key);
  }

  @override
  void saveToken(String? token) async {
    if (token == null) {
      return;
    }
    await _prefs.setString(_key, jsonEncode(token));
  }
}
