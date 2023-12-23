


// ignore_for_file: depend_on_referenced_packages

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

abstract class IHelixworldsSDKService{
  /// set isAR = true then it will process the image detection using amazon rekognition
  Future<Either<Failure, Success>> scanItem({bool isAR = false});
  Future<Either<Failure, Success>> scanItems(InputImage image);  
  Future<Either<Failure, Success>> scanItemsByAR(XFile image);

  Future<Either<Failure, String>> getUserId();
  Future<Either<Failure, Success>> cacheFavoritesItem(InventoryItemModel model);
  Future<Either<Failure, List<MyLogModel>>> fetchFavoritesItems();
  Future<Either<Failure, List<MyLogModel>>> fetchScannedItems();
  Future<Either<Failure, Success>> redirectToUrl(String murl); 
  bool isLocalFetch();
  String getDefaultUserId();

  /// analytics mixpanel tracking event
  Future<Either<Failure, Success>> trackAnalyticsMixpanel(String name, Map<String, dynamic> value);
  AnalyticsRepository getAnalyticsRepoService();
} 

class HelixworldsSDKService extends IHelixworldsSDKService {
  final IUserDetailsRepository userDetailsRepo;
  final ScanRepository scanRepo;
  final ILogLocalDatasource logLocaDatasource;
  final ImagePicker picker;
  final HelperUtil _helperUtil;
  final bool isLocal;
  final IAnalyticsMixpanelsRemoteDatasource analyticsMixpanelsRemoteDatasource;
  HelixworldsSDKService(this.userDetailsRepo, this.scanRepo, this.logLocaDatasource, this.picker, this._helperUtil, this.analyticsMixpanelsRemoteDatasource, {this.isLocal = true});

  @override
  Future<Either<Failure, Success>> scanItems(InputImage image) async {
    try{
       if(isLocalFetch()){
        var result = await scanRepo.processImageLocal(image);
        var rightResult = result.fold((l) => null, (r) => r);
        var leftResult = result.fold((l) => l, (r) => null);
        var userResult = await getUserId();
        var userRightValue = userResult.fold((l) => null, (r) => r);
        if(result.isRight()){
          return Right(ObjectDetectedSuccess(rightResult!, userResult.isRight() ? userRightValue ?? "" : ""));
        } else {
          return Left(leftResult!);
        }
      } else {
          // using the gatherer database
          var result = await scanRepo.processImage(image);
          var rightResult = result.fold((l) => null, (r) => r);
          var leftResult = result.fold((l) => l, (r) => null);
          var userResult = await getUserId();
          var userRightValue = userResult.fold((l) => null, (r) => r);
          if(result.isRight()){
            return Right(ObjectDetectedSuccess(rightResult!, userResult.isRight() ? userRightValue ?? "" : ""));
          } else {
            return Left(leftResult!);
          }
      }
    } catch(e) {
      return Left(ItemNotDetectedFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> scanItem({bool isAR = false}) async {
    try{
      var image = await picker.pickImage(source: ImageSource.camera);
      var imageInput = _helperUtil.getInputImageFile(image!);
      if(isAR){
        var result = await scanItemsByAR(image);
        return result;
      } else {
        var result = await scanItems(imageInput);
        return result;
      }
    } catch(e) {
      return Left(ItemNotDetectedFailure());
    }
  }

  String? userId = "";
  @override
  Future<Either<Failure, String>> getUserId() async {
    try{
      if(userId?.isEmpty ?? false){
        var result = await userDetailsRepo.getUserID();
        result.fold((l) => null, (r) {
          userId = r;
        });
        if(result.isRight()){
          var rightResult = result.fold((l) => null, (r) => r);
          return Right(rightResult ?? "");
        } else {
          return Left(GetUserIDFailure());
        }
      } else {
        return Right(userId!);
      }
    }catch(e){
      return Left(GetUserIDFailure());
    }
  }
  
  @override
  String getDefaultUserId() {
    if(userId?.isNotEmpty  ?? false){
      return userId ?? "";
    } else {
      return "";
    }
  }
  
  @override
  Future<Either<Failure, Success>> cacheFavoritesItem(InventoryItemModel model) {
    var itemResult = scanRepo.cacheSavedItem(model);
    return itemResult;
  }
  
  @override
  Future<Either<Failure, List<MyLogModel>>> fetchFavoritesItems() async {
    var result = await logLocaDatasource.getSavedItems();
    return result;
  }
  
  @override
  Future<Either<Failure, List<MyLogModel>>> fetchScannedItems() async {
    var result = await logLocaDatasource.getLogs();
    return result;
  }
  
  @override
  Future<Either<Failure, Success>> redirectToUrl(String murl) async {
    final userParam =
        (userId?.isNotEmpty ?? false) ? '?userId=$userId' : '';
    final Uri url =
        Uri.parse(murl + userParam);
    var result = await _helperUtil.redirectUrl(url);
    if(result.isRight()){
      return Right(RedirectWebSuccess());
    } else {
      return const Left(WebRouteFailure(""));
    }
  }
  
  @override
  bool isLocalFetch() {
    return isLocal;
  }
  
  @override
  Future<Either<Failure, Success>> scanItemsByAR(XFile image) async {
    var result = await scanRepo.processImageAR(image);
    var rightResult = result.fold((l) => null, (r) => r);
    if(result.isRight()){
      return Right(ObjectDetectedSuccess(rightResult!, getDefaultUserId()));
    } else {
      return Left(ItemNotDetectedFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> trackAnalyticsMixpanel(String name, Map<String, dynamic> value) async {
    try{
      var result = await analyticsMixpanelsRemoteDatasource.trackEvent(name, value);
      return result;
    }catch(e){
      return Left(HSSDKFailure());
    }
  }
  
  @override
  AnalyticsRepository getAnalyticsRepoService() {
    return getAnalyticsRepo();
  }


}