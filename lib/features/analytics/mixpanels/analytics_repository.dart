import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';

abstract class IAnalyticsRepository {

  // mixpanels services
  /// track installs from devices using mixpanels
  Future<Either<Failure, Success>> mixPanelsTrackInstalls();
  /// tracks scanned items using mixpanels
  Future<Either<Failure, Success>> mixPanelsScannedItems(InventoryItemModel item);
  Future<Either<Failure, Success>> mixPanelsRedirectToShopEvent(String url, String userId);
  Future<Either<Failure, Success>> mixPanelsSavedItems(InventoryItemModel item);
}

class AnalyticsRepository extends IAnalyticsRepository {
  final IAnalyticsMixpanelsRemoteDatasource mixPanelRemoteDS;
  AnalyticsRepository(this.mixPanelRemoteDS);

  @override
  Future<Either<Failure, Success>> mixPanelsTrackInstalls() async {
    try {
      print("Tracking installs");
      var result = await mixPanelRemoteDS.trackEvent("installs", {"deviceModel": "Samsung s21 Plus", "os":"Android"});
      return result;
    } catch(e) {
      print("Mixpanels");
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
}