import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String localKeyGathererToken = "local_key_gatherer_token";
const String localKeyValorToken = "local_key_valor_token";

abstract class IAuthLocalDatasource {
  Future<Either<Failure, Success>> cacheValorAccessToken(String token);
  Future<Either<Failure, String>> getValorAccessToken();
  Future<Either<Failure, Success>> cacheGathererAccessToken(String token);
  Future<Either<Failure, String>> getGathererAccessToken();
}

class AuthLocalDatasource extends IAuthLocalDatasource {
  final SharedPreferences _sharedPref;
  AuthLocalDatasource(this._sharedPref);

  @override
  Future<Either<Failure, Success>> cacheGathererAccessToken(
      String token) async {
    try {
      var result = await _sharedPref.setString(localKeyGathererToken, token);
      if (result) {
        return Right(CacheSuccess());
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(LocalDatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getGathererAccessToken() async {
    try {
      var result = _sharedPref.getString(localKeyGathererToken);
      return Right(result ?? "");
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> cacheValorAccessToken(String token) async {
    try {
      var result = await _sharedPref.setString(localKeyValorToken, token);
      if (result) {
        return Right(CacheSuccess());
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(LocalDatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getValorAccessToken() async {
    try {
      var result = _sharedPref.getString(localKeyValorToken);
      return Right(result ?? "");
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
