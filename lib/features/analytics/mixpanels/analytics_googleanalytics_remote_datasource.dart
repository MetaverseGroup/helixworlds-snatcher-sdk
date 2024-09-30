import 'package:dartz/dartz.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';

abstract class IGoogleAnalyticsRemoteDatasource {
  Future<Either<Failure, Success>> sendAnalytics(
      String event, Map<String, dynamic> value);
}

class GoogleAnalyticsRemoteDatasource extends IGoogleAnalyticsRemoteDatasource {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  GoogleAnalyticsRemoteDatasource(this.analytics, this.observer);

  @override
  Future<Either<Failure, Success>> sendAnalytics(
      String event, Map<String, dynamic> value) async {
    try {
      Map<String, Object> objectMap = value.map((key, value) {
        if (value == null) {
          throw ArgumentError('Null value found for key: $key');
        }
        return MapEntry(key, value as Object);
      });
      analytics.logEvent(name: event, parameters: objectMap);
      return Right(AnalyticsLogsSuccess());
    } catch (e) {
      return Left(AnalyticsLogsFailure());
    }
  }
}
