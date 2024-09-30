// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/log_model.dart';

const String local_key_logs = "local_key_logs";
const String local_saved_items_logs = "local_saved_items_logs";

abstract class ILogLocalDatasource {
  Future<Either<Failure, Success>> cacheSaveItems(List<MyLogModel> logs);
  Future<Either<Failure, List<MyLogModel>>> getSavedItems();

  Future<Either<Failure, Success>> cacheLogs(List<MyLogModel> logs);
  Future<Either<Failure, List<MyLogModel>>> getLogs();
}

class LogLocalDatasource extends ILogLocalDatasource {
  final SharedPreferences _sharedPref;
  LogLocalDatasource(this._sharedPref);

  @override
  Future<Either<Failure, Success>> cacheLogs(List<MyLogModel> logs) async {
    try {
      final String jsonString =
          jsonEncode(logs.map((obj) => obj.toJson()).toList());
      _sharedPref.setString(local_key_logs, jsonString);
      return Right(CacheSuccess());
    } catch (e) {
      return Left(LocalDatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, List<MyLogModel>>> getLogs() async {
    try {
      final String jsonString = _sharedPref.getString(local_key_logs) ?? "";
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<MyLogModel> objects =
          jsonList.map((json) => MyLogModel.fromJson(json)).toList();
      return Right(objects);
    } catch (e) {
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, Success>> cacheSaveItems(List<MyLogModel> logs) async {
    try {
      final String jsonString =
          jsonEncode(logs.map((obj) => obj.toJson()).toList());
      _sharedPref.setString(local_saved_items_logs, jsonString);
      return Right(CacheSuccess());
    } catch (e) {
      return Left(LocalDatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, List<MyLogModel>>> getSavedItems() async {
    try {
      final String jsonString =
          _sharedPref.getString(local_saved_items_logs) ?? "";
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<MyLogModel> objects =
          jsonList.map((json) => MyLogModel.fromJson(json)).toList();
      return Right(objects);
    } catch (e) {
      return const Right([]);
    }
  }
}
