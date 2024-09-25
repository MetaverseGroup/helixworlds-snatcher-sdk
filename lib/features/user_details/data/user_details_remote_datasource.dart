// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';

import '../../../core/failure.dart';

abstract class IUserDetailsRemoteDatasource {
  Future<Either<Failure, String>> getUserId();
  Future<Either<Failure, String>> getUserEmail();
  Future<Either<Failure, Success>> login(String clientId, String secretKey);
  Future<Either<Failure, Success>> createUser();
}

class UserDetailsRemoteDatasource extends IUserDetailsRemoteDatasource {
  final Dio dio;
  UserDetailsRemoteDatasource(this.dio);

  @override
  Future<Either<Failure, String>> getUserId() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      final options = Options(headers: headers);
      var response = await dio.get("$baseUrl/user/find", options: options);
      return Right(response.data["extId"] ?? "");
    } catch (e) {
      return Left(GetUserIDFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getUserId() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      final options = Options(headers: headers);
      var response = await dio.get("$baseUrl/user/find", options: options);
      return Right(response.data["extId"] ?? "");
    } catch (e) {
      return Left(GetUserIDFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> createUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> login(String clientId, String secretKey) {
    throw UnimplementedError();
  }
}
