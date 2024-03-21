


// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

abstract class IAnalyticsRudderStackRemoteDatasource {
  Future<Either<Failure, Success>> trackEvent(String name, RudderProperty value);
}
class AnalyticsRudderStackRemoteDatasource extends IAnalyticsRudderStackRemoteDatasource {
  final RudderController rudderController;
  AnalyticsRudderStackRemoteDatasource(this.rudderController);
  @override
  Future<Either<Failure, Success>> trackEvent(String name, RudderProperty value) async {
    try{
      rudderController.track(name, properties: value);
      return Right(AnalyticsLogsSuccess());
    }catch(e){
      return Left(AnalyticsLogsFailure());
    }
  }

}