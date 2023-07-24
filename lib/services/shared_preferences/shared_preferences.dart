import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // singleton boilerplate
  static final SharedPreferencesService _singleton =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _singleton;

  SharedPreferencesService._internal() {
    _instance = SharedPreferences.getInstance();
  }
  // end singleton boilerplate

  late Future<SharedPreferences> _instance;

  Future<String> get globalState async {
    final prefs = await _instance;
    return prefs.getString(_SharedPreferencesKey.globalState.name) ?? '{}';
  }

  Future<void> setGlobalState(String value) async {
    final prefs = await _instance;
    prefs.setString(_SharedPreferencesKey.globalState.name, value);
  }
}

enum _SharedPreferencesKey {
  globalState,
  ;
}
