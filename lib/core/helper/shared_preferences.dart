import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _prefInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefInstance = await _instance;
    return _prefInstance;
  }

  static String? getString(String key) {
    return _prefInstance?.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    var pref = await _instance;
    return pref.setString(key, value);
  }

  static Future<bool> remove(String key) async {
    var pref = await _instance;
    return pref.remove(key);
  }
}
