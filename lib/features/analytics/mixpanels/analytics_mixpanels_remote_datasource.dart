import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

abstract class IAnalyticsMixpanelsRemoteDatasource {
  Future<Either<Failure, Success>> trackEvent(String name, Map<String, dynamic> value);
}


class AnalyticsMixpanelsRemoteDatasource extends IAnalyticsMixpanelsRemoteDatasource {
  final Mixpanel mixpanel;
  AnalyticsMixpanelsRemoteDatasource(this.mixpanel);
  @override
  Future<Either<Failure, Success>> trackEvent(String name, Map<String, dynamic> value) async {
    try{
      mixpanel.track(name, properties: value);
      return Right(AnalyticsLogsSuccess());
    }catch(e) {
      print("ERROR");
      print(e);
      return Left(AnalyticsLogsFailure());
    }
  }
}