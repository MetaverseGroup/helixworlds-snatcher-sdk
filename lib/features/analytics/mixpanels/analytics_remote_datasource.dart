



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';

abstract class IAnalyticsRemoteDatasource {
  Future<Either<Failure, Success>> trackEvent(final String userId, String name, String inventoryId, String parameters);
}


class AnalyticsRemoteDatasource extends IAnalyticsRemoteDatasource {
  final Dio _dio;
  AnalyticsRemoteDatasource(this._dio);

  @override
  Future<Either<Failure, Success>> trackEvent(String userId, String name, String inventoryId, String parameters) async {
    try{
        final response = await _dio.post(
          '$baseUrl/v3/user/$userId/track/mobile',
          options: Options(
            contentType: "application/json"
          ),
          data: {
            name: name,
            inventoryId: inventoryId,
            parameters: parameters
          }
        );
        if(response.statusCode == 201 || response.statusCode == 200) {
          return Right(AnalyticsLogsSuccess());
        } else {
          return Left(AnalyticsLogsFailure());
        }
    } catch(e) {
      return Left(GetItemByIDRemoteFailure());
    }
  }
  
}