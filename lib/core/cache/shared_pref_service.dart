import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean(String key, bool value) {
    return prefs.setBool(key, value);
  }

  static bool? getBoolean(String key) {
    return prefs.getBool(key);
  }

  static Future<bool> removie(String key) {
    return prefs.remove(key);
  }
}
