


import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_remote_datasource.dart';

abstract class IAuthRepository {
    Future<Either<Failure, Success>> mobileLogin(String clientId, String secretKey, {String field = "destination"});
    Future<Either<Failure, String>> getGathererAccessToken();
}

class AuthRepository extends IAuthRepository {
  final IAuthLocalDatasource _localDS;
  final IAuthRemoteDatasource _remoteDS;
  AuthRepository(this._localDS, this._remoteDS);

  @override
  Future<Either<Failure, Success>> mobileLogin(String clientId, String secretKey, {String field = "destination"}) async {
    try {
      var result = await _remoteDS.mobileLogin(clientId, secretKey, field);
      if(result.isRight()){
        var rightResult = result.fold((l) => null, (r) => r);
        var cacheResult = await _localDS.cacheGathererAccessToken(rightResult is AuthSuccessToken ? rightResult.accessToken : "");
        return cacheResult;
      } else {
        return Left(CacheFailure());
      }
    } catch(e) {
      return Left(AuthenticationFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> getGathererAccessToken() async {
    try{
      var result = await _localDS.getGathererAccessToken();
      return result;
    }catch(e){
      return Left(RepositoryFailure());
    }
  }


}