import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAnalyticsRepository {

  // mixpanels services
  /// track installs from devices using mixpanels
  Future<Either<Failure, Success>> mixPanelsTrackInstalls();
  /// tracks scanned items using mixpanels
  Future<Either<Failure, Success>> mixPanelsScannedItems(InventoryItemModel item);
  Future<Either<Failure, Success>> mixPanelsRedirectToShopEvent(String url, String userId);
  Future<Either<Failure, Success>> mixPanelsRedirectToShopEventItemId(String url, String userId, String itemId);
  Future<Either<Failure, Success>> mixPanelsSavedItems(InventoryItemModel item);
}
const String localKeyInstallation = "localKeyInstallation";

class AnalyticsRepository extends IAnalyticsRepository {
  final IAnalyticsMixpanelsRemoteDatasource mixPanelRemoteDS;
  final SharedPreferences _sharedPref;
  AnalyticsRepository(this.mixPanelRemoteDS, this._sharedPref);

  @override
  Future<Either<Failure, Success>> mixPanelsTrackInstalls() async {
    try {
      var result = _sharedPref.getBool(localKeyInstallation) ?? false;
      if(result == false){
        var result = await mixPanelRemoteDS.trackEvent("installs", {});
        return result;
      } else {
        _sharedPref.setBool(localKeyInstallation, true);
        return Right(AnalyticsLogsSuccess());
      }
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> mixPanelsScannedItems(InventoryItemModel item) async {
    try {
      var result = await mixPanelRemoteDS.trackEvent("scanned_items", item.toJson());
      return result;
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> mixPanelsRedirectToShopEvent(String url, String userId) async {
    try {
      var result = await mixPanelRemoteDS.trackEvent("redirect_to_shop", {"url": url, "userId": userId});
      return result;
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> mixPanelsSavedItems(InventoryItemModel item) async {
    try {
      var result = await mixPanelRemoteDS.trackEvent("saved_items", item.toJson());
      return result;
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> mixPanelsRedirectToShopEventItemId(String url, String userId, String itemId) async {
    try {
      var result = await mixPanelRemoteDS.trackEvent("redirect_to_shop", {"url": url, "userId": userId, "itemId": itemId });
      return result;
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
}