import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final SharedPrefService _instance = SharedPrefService._internal();
  factory SharedPrefService() => _instance;

  SharedPreferences? _prefs;

  SharedPrefService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save Data
  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // Read Data
  String? getString(String key) => _prefs?.getString(key);
  int? getInt(String key) => _prefs?.getInt(key);
  bool? getBool(String key) => _prefs?.getBool(key);

  // Remove Specific Key
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Clear All Data
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
