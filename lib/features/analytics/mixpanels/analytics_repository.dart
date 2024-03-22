// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_googleanalytics_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_rudderstack_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

abstract class IAnalyticsRepository {

  Future<Either<Failure, Success>> analyticsTrackInstalls();
  Future<Either<Failure, Success>> analyticsScannedItems(InventoryItemModel item);
  Future<Either<Failure, Success>> analyticsAttemptScannedItems(Map<String, dynamic> scanResult, InventoryItemModel expectedItem);

  Future<Either<Failure, Success>> analyticsRedirectToShopEvent(String url, String userId);
  Future<Either<Failure, Success>> analyticsRedirectToShopEventItemId(String url, String userId, String itemId);
  Future<Either<Failure, Success>> analyticsSavedItems(InventoryItemModel item);
}
const String localKeyInstallation = "localKeyInstallation";
const String analytics_installKey = "installs";
const String analytics_scannedItems = "scanned_items";
const String analytics_redirectToShop = "redirect_to_shop";
const String analytics_savedItems = "saved_items";
const String analytics_attemptScannedItems = "attempt_scanned_items";
const String analytics_redirectToShopEventId = "analytics_redirectToShopEventId";

class AnalyticsRepository extends IAnalyticsRepository {
  final IAnalyticsMixpanelsRemoteDatasource? mixPanelRemoteDS;
  final SharedPreferences _sharedPref;
  final IGoogleAnalyticsRemoteDatasource? googleAnalyticsRemoteDS;
  final IAnalyticsRudderStackRemoteDatasource? rudderStackRemoteDS;
  AnalyticsRepository(this._sharedPref, {this.googleAnalyticsRemoteDS, this.mixPanelRemoteDS, this.rudderStackRemoteDS});

  @override
  Future<Either<Failure, Success>> analyticsTrackInstalls() async {
    try {
      var result = _sharedPref.getBool(localKeyInstallation) ?? false;
      if(result == false){
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_installKey, {});
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_installKey, {});
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_installKey, RudderProperty().putValue(key: analytics_installKey, value: {}));
        }
        return Right(AnalyticsLogsSuccess());
      } else {
        _sharedPref.setBool(localKeyInstallation, true);
        return Right(AnalyticsLogsSuccess());
      }
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsScannedItems(InventoryItemModel item) async {
    try {
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_scannedItems, item.toJson());
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_scannedItems, item.toJson());
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_scannedItems, RudderProperty().putValue(key: analytics_scannedItems, value: item.toJson()));
        }
        return Right(AnalyticsLogsSuccess());
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsRedirectToShopEvent(String url, String userId) async {
    try {
        dynamic value = {"url": url, "userId": userId};
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_redirectToShop, value);
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_redirectToShop, value);
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_redirectToShop, RudderProperty().putValue(key: analytics_redirectToShop, value: value));
        }
        return Right(AnalyticsLogsSuccess());
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsSavedItems(InventoryItemModel item) async {
    try {
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_savedItems, item.toJson());
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_savedItems, item.toJson());
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_savedItems, RudderProperty().putValue(key: analytics_savedItems, value: item.toJson()));
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsRedirectToShopEventItemId(String url, String userId, String itemId) async {
    try {
        dynamic value = {"url": url, "userId": userId, "itemId": itemId };

        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_redirectToShopEventId, value);
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_redirectToShopEventId, value);
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_redirectToShopEventId, RudderProperty().putValue(key: analytics_savedItems, value: value));
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsAttemptScannedItems(Map<String, dynamic> scanResult, InventoryItemModel expectedItem) async {
    try {
        dynamic value = {"scan_result": scanResult, "expected_item": expectedItem.toJson() };
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent(analytics_attemptScannedItems, value);
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics(analytics_attemptScannedItems, value);
        }
        if(rudderStackRemoteDS != null){
          await rudderStackRemoteDS?.trackEvent(analytics_attemptScannedItems, RudderProperty().putValue(key: analytics_savedItems, value: value));
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
}