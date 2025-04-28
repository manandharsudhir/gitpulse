
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/exceptions/persistance_exceptions.dart';

class SharedPreferencesImp {
  SharedPreferencesImp._();
  static SharedPreferences? _sharedPreferences;
  SharedPreferences get instance =>
      _sharedPreferences ?? (throw Exception("Not Initialized"));

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String read(String key) {
    try {
      return _sharedPreferences?.getString(key) ?? "";
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static bool readBool(String key) {
    try {
      return _sharedPreferences?.getBool(key) ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> write<T>(String key, T value) async {
    try {
      return _sharedPreferences!.setString(key, value as String);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> writeBool(String key, bool value) async {
    try {
      return _sharedPreferences!.setBool(key, value);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> delete(String key) async {
    return _sharedPreferences!.remove(key);
  }

  static Future<void> deleteAll() {
    return _sharedPreferences!.clear();
  }

  static Future<void> logout() async {
    _sharedPreferences?.getKeys().forEach((element) async {
      await _sharedPreferences?.remove(element);
    });
    await _sharedPreferences!.clear();
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
