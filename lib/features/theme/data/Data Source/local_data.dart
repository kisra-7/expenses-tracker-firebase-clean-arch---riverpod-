import 'package:expenses_tracker/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  final SharedPreferences _prefs;
  LocalData(this._prefs);

  bool getThemeData() {
    return _prefs.getBool(ConstantsValues().themeKey) ?? false;
  }

  Future<void> setThemeData(bool isDark) async {
    _prefs.setBool(ConstantsValues().themeKey, isDark);
  }
}
