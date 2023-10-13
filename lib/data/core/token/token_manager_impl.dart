import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'token_manager.dart';

class TokenManagerImpl implements TokenManager {
  final SharedPreferences _prefs;

  TokenManagerImpl(this._prefs);

  final String _key = 'token_key';

  @override
  String? getToken() {
    return _prefs.getString(_key);
  }

  @override
  void save(String token) async {
    await _prefs.setString(_key, jsonEncode(token));
  }
}
