


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';

abstract class IAuthRemoteDatasource {
  Future<Either<Failure, Success>> mobileLogin(String clientId, String secretKey, String field);
}

class AuthRemoteDatasource extends IAuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDatasource(this.dio);
  

  @override
  Future<Either<Failure, Success>> mobileLogin(String clientId, String secretKey, String field) async {
    try{
        final response = await dio.post(
          '$baseUrl/auth/login',
          options: Options(
            contentType: "application/json"
          ),
          data: {
            "clientId": clientId,
            "secret": secretKey,
            "field": field
          }
        );
        if (response.statusCode == 200) {
          return Right(AuthSuccessToken(response.data["access_token"]));
        } else {
          return Left(GetItemByIDRemoteFailure());
        }
    } catch(e) {
      return Left(GetItemByIDRemoteFailure());
    }
  } 


}