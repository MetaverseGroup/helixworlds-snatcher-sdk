import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';

import '../../../core/failure.dart';


abstract class IUserDetailsRemoteDatasource {
  Future<Either<Failure, String>> getUserId();
  Future<Either<Failure, Success>> login(String clientId, String secretKey);
  Future<Either<Failure, Success>> createUser();
}

class UserDetailsRemoteDatasource extends IUserDetailsRemoteDatasource {
  final Dio dio;
  UserDetailsRemoteDatasource(this.dio);
  
  @override
  Future<Either<Failure, String>> getUserId() async {
    // TODO: implement getUserId
    try{
      // TODO: implement authenticate
      var response = await dio.get(baseUrl+"/user/find",
        // options: Options(
        //   contentType: "application/x-www-form-urlencoded"
        // )
      );
      return Right(response.data["extId"] ?? "");
    } catch(e){
      return Left(GetUserIDFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> createUser() {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Success>> login(String clientId, String secretKey) {
    // TODO: implement login
    throw UnimplementedError();
  }

}