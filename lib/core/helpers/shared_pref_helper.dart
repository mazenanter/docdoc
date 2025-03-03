import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  ///Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> saveData(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value);
        break;
      default:
        throw Exception('Type not supported');
    }
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// Gets an Int value from SharedPreferences with given [key].
  static getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  /// Gets an Boolean value from SharedPreferences with given [key].
  static getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  /// Gets an Double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
