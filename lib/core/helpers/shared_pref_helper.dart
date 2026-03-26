import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _sharedPreferences?.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences?.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value) {
      case String v:
        await _sharedPreferences?.setString(key, v);
      case int v:
        await _sharedPreferences?.setInt(key, v);
      case bool v:
        await _sharedPreferences?.setBool(key, v);
      case double v:
        await _sharedPreferences?.setDouble(key, v);
      default:
        break;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool getBool(String key) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _sharedPreferences?.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble(String key) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _sharedPreferences?.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int getInt(String key) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _sharedPreferences?.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static String getString(String key) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _sharedPreferences?.getString(key) ?? '';
  }

  /// Saves a List of Strings in SharedPreferences.
  static Future<void> setStringList(String key, List<String> value) async {
    await _sharedPreferences?.setStringList(key, value);
  }

  /// Gets a List of Strings from SharedPreferences.
  static List<String> getStringList(String key) {
    return _sharedPreferences?.getStringList(key) ?? [];
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}