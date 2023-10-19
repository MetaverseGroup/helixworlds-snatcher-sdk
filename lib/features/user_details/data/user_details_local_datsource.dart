import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserDetailsLocalDatasource {}

class UserDetailsLocalDatasource extends IUserDetailsLocalDatasource {
  final SharedPreferences _sharedPref;
  UserDetailsLocalDatasource(this._sharedPref);
  


}

