


import 'package:dartz/dartz.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';

abstract class IGoogleAnalyticsRemoteDatasource {
  Future<Either<Failure, Success>> sendAnalytics(String event, Map<String, dynamic> value);
}


class GoogleAnalyticsRemoteDatasource extends IGoogleAnalyticsRemoteDatasource {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  GoogleAnalyticsRemoteDatasource(this.analytics, this.observer);
  
  @override
  Future<Either<Failure, Success>> sendAnalytics(String event, Map<String, dynamic> value) async {
    try {
      analytics.logEvent(name: event, parameters: value);
      return Right(AnalyticsLogsSuccess());
    } catch(e) {
      return Left(AnalyticsLogsFailure());
    }
  }

   
}