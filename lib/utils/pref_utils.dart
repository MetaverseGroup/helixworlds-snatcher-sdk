//ignore: unused_import
// ignore_for_file: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  final SharedPreferences _sharedPreferences;
  PrefUtils(this._sharedPreferences);

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
