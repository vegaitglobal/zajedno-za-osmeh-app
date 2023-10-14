import 'dart:convert';

import 'package:gu_mobile/data/example_feature/local/example_storage.dart';
import 'package:gu_mobile/data/example_feature/model/example_model_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExampleStorageImpl implements ExampleStorage {
  final SharedPreferences _prefs;

  ExampleStorageImpl(this._prefs);

  final String _key = 'example_key';

  @override
  ExampleModelResponse? getValue() {
    final data = _prefs.getString(_key);
    if (data == null) return null;
    return ExampleModelResponse.fromJson(jsonDecode(data));
  }

  @override
  void save(ExampleModelResponse value) async {
    await _prefs.setString(_key, jsonEncode(value.toJson()));
  }
}
