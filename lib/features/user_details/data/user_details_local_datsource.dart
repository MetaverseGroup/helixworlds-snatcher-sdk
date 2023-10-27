// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserDetailsLocalDatasource {}

class UserDetailsLocalDatasource extends IUserDetailsLocalDatasource {
  // ignore: unused_field
  final SharedPreferences _sharedPref;
  UserDetailsLocalDatasource(this._sharedPref);
  


}

