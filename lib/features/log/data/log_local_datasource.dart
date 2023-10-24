
import 'dart:convert';
import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/log_model.dart';

const String local_key_logs = "local_key_logs";

abstract class ILogLocalDatasource {
  Future<Either<Failure, Success>> cacheLogs(List<MyLogModel> logs);
  Future<Either<Failure, List<MyLogModel>>> getLogs();

}

class LogLocalDatasource extends ILogLocalDatasource {
  final SharedPreferences _sharedPref;
  LogLocalDatasource(this._sharedPref);
  
  @override
  Future<Either<Failure, Success>> cacheLogs(List<MyLogModel> logs) async {
    // TODO: implement cacheLogs
    try{
      final String jsonString = jsonEncode(logs.map((obj) => obj.toJson()).toList());
      _sharedPref.setString(local_key_logs, jsonString);
      return Right(CacheSuccess());
    }catch(e){
      return Left(LocalDatasourceFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<MyLogModel>>> getLogs() async {
    // TODO: implement getLogs
    try{
      final String jsonString =  _sharedPref.getString(local_key_logs) ?? "";
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<MyLogModel> objects = jsonList.map((json) => MyLogModel.fromJson(json)).toList();
      return Right(objects);
    }catch(e){
      return const Right([]);
    }
  }
}

