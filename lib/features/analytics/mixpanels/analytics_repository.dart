import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_googleanalytics_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAnalyticsRepository {

  Future<Either<Failure, Success>> analyticsTrackInstalls();
  Future<Either<Failure, Success>> analyticsScannedItems(InventoryItemModel item);
  Future<Either<Failure, Success>> analyticsAttemptScannedItems(Map<String, dynamic> scanResult, InventoryItemModel expectedItem);

  Future<Either<Failure, Success>> analyticsRedirectToShopEvent(String url, String userId);
  Future<Either<Failure, Success>> analyticsRedirectToShopEventItemId(String url, String userId, String itemId);
  Future<Either<Failure, Success>> analyticsSavedItems(InventoryItemModel item);
}
const String localKeyInstallation = "localKeyInstallation";

class AnalyticsRepository extends IAnalyticsRepository {
  final IAnalyticsMixpanelsRemoteDatasource? mixPanelRemoteDS;
  final SharedPreferences _sharedPref;
  final IGoogleAnalyticsRemoteDatasource? googleAnalyticsRemoteDS;
  AnalyticsRepository(this._sharedPref, {this.googleAnalyticsRemoteDS, this.mixPanelRemoteDS});

  @override
  Future<Either<Failure, Success>> analyticsTrackInstalls() async {
    try {
      var result = _sharedPref.getBool(localKeyInstallation) ?? false;
      if(result == false){
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent("installs", {});
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("installs", {});
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
          await mixPanelRemoteDS?.trackEvent("scanned_items", item.toJson());
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("scanned_items", item.toJson());
        }
        return Right(AnalyticsLogsSuccess());
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsRedirectToShopEvent(String url, String userId) async {
    try {
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent("redirect_to_shop", {"url": url, "userId": userId});
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("redirect_to_shop", {"url": url, "userId": userId});
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
          await mixPanelRemoteDS?.trackEvent("saved_items", item.toJson());
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("saved_items", item.toJson());
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsRedirectToShopEventItemId(String url, String userId, String itemId) async {
    try {
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent("redirect_to_shop", {"url": url, "userId": userId, "itemId": itemId });
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("redirect_to_shop", {"url": url, "userId": userId, "itemId": itemId });
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> analyticsAttemptScannedItems(Map<String, dynamic> scanResult, InventoryItemModel expectedItem) async {
    try {
        if(mixPanelRemoteDS != null){
          await mixPanelRemoteDS?.trackEvent("attempt_scanned_items", {"scan_result": scanResult, "expected_item": expectedItem.toJson() });
        }
        if(googleAnalyticsRemoteDS != null){
          await googleAnalyticsRemoteDS?.sendAnalytics("attempt_scanned_items", {"scan_result": scanResult, "expected_item": expectedItem.toJson() });
        }
        return Right(AnalyticsLogsSuccess());      
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
}