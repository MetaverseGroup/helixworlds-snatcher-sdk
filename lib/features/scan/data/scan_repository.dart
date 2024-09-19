// ignore_for_file: depend_on_referenced_packages, avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/failure.dart';
import 'model/scan_model.dart';

abstract class IScanRepository {
  Future<Either<Failure, InventoryItemModel>> processImageAR(XFile image);
  /// pass the ID of the object detected from image detector ex. p001
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);
  Future<Either<Failure, List<MyLogModel>>> getSavedItems();
  Future<Either<Failure, Success>> cacheSavedItem(InventoryItemModel items);
  Future<Either<Failure, Success>> deleteSavedItem(MyLogModel item);

  Future<Either<Failure, String>> getGathererAccessToken();
}

class ScanRepository extends IScanRepository {
  final ILogLocalDatasource logLocalDS;
  final IScanRemoteDatasource _remoteDS;
  final IScanLocalDatasource _localDS;
  final HelperUtil _helperUtil;
  final IAuthLocalDatasource _authLocalDS;


  ScanRepository(this.logLocalDS, this._localDS, this._remoteDS, this._helperUtil, this._authLocalDS);

  logModel(InventoryItemModel object) async {
    var logsResult = await logLocalDS.getLogs();
    List<MyLogModel> newLogs = [];
    List<MyLogModel> logs = logsResult.fold((l) => null, (r) => r) ?? [];
    newLogs.addAll(logs);
    final model = MyLogModel(
              id: object.id,
              name: object.title,
              image: object.images?.first.file.downloadUrl,
              date: _helperUtil.getDateString(),
              // game: object.projectId,
              url: object.url ?? ""
    );
    newLogs.add(model);
    // cache the first 10 items 
    if(newLogs.length > 10){
      logLocalDS.cacheLogs(newLogs.reversed.toList().take(10).toList());
    } else {
      logLocalDS.cacheLogs(newLogs);
    }
  }
  
  @override
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id) async {
    try{
      var localDataSearchResult = await _localDS.fetchInventoryItemByID(id);
      if(localDataSearchResult.isRight()){
        var item = localDataSearchResult.fold((l) => null, (r) => r);
        return Right(item!);
      } else {
        var remoteDataSearchResult = await _remoteDS.getInventoryItemByID(id);
        if(remoteDataSearchResult.isRight()){
          var item = remoteDataSearchResult.fold((l) => null, (r) => r);
          _localDS.cacheInventoryItem(item!);
          return remoteDataSearchResult;
        } else {
          return remoteDataSearchResult;
        }
      }
    }catch(e){
      return Left(RepositoryFailure());
    }
  }

  @override
  Future<Either<Failure, InventoryItemModel>> processImageAR(XFile photo) async {
    try {
        var tokenResult = await _authLocalDS.getGathererAccessToken();
        var token = tokenResult.fold((l) => null, (r) => r);

        var result = await _remoteDS.objectScannedV5(photo, token ?? "");
        if(result.isRight()) {
          var rightResult = result.fold((l) => null, (r) => r);

          List<ImageInfo> images = [];
          if(rightResult?.inventory?.images?.isNotEmpty ?? false) {
            for(var item in rightResult!.inventory!.images!){
              images.add(ImageInfo(
                file: item.file ?? const FileInfo(downloadUrl: "")
              ));
            }
          }

          var rightValue = InventoryItemModel(
            id: rightResult?.virtualItem?.id ?? "",
            title: rightResult?.virtualItem?.title ?? "",
            images: images,
            url: rightResult?.inventory?.productUrl ?? "",
            description: rightResult?.virtualItem?.description ?? "",
            isCoupon: rightResult?.code?.isEmpty ?? true ? false : true,
            code: rightResult?.code ?? "",
            quantityRemaining: 0,
            maximumRedemptions: 0,
          );



          return Right(rightValue);

      } else {
          return Left(ItemNotDetectedFailure());
      }
    } catch (e) {
      return Left(ItemNotDetectedFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> cacheSavedItem(InventoryItemModel items) async {
    try{
      var accessTokenResult = await _authLocalDS.getValorAccessToken();
      var token = accessTokenResult.fold((l) => null, (r) => r) ?? "";

      var localResult = await logLocalDS.getSavedItems();
      final model = MyLogModel(
                id: items.id,
                productId: items.id,
                name: items.title,
                image: items.images?.first.file.downloadUrl ?? '',
                date: _helperUtil.getDateString(),
                url: items.url ?? ""
      );
      List<MyLogModel> myitems = [];
      List<MyLogModel> logItems = localResult.fold((l) => null, (r) => r) ?? [];
      myitems.addAll(logItems);
      var result = await _remoteDS.newSavedScans(token, model);
      var itemResult = result.fold((l) => null, (r) => r);
      myitems.add(itemResult!);
      if(myitems.length > 10){
        logLocalDS.cacheSaveItems(myitems.reversed.toList());
      } else {
        logLocalDS.cacheSaveItems(myitems);
      }
      return Right(CacheSuccess());
    }catch(e){
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> deleteSavedItem(MyLogModel item) async {
    try{
      var accessTokenResult = await _authLocalDS.getValorAccessToken();
      var token = accessTokenResult.fold((l) => null, (r) => r) ?? "";

      var localResult = await logLocalDS.getSavedItems();
      List<MyLogModel> myitems = [];
      List<MyLogModel> logItems = localResult.fold((l) => null, (r) => r) ?? [];
      myitems.addAll(logItems);
      myitems.removeWhere((element) => element.id == item.id);

      await _remoteDS.deleteSavedScans(token, item.id ?? "");
      
      if(myitems.length > 10){
        logLocalDS.cacheSaveItems(myitems.reversed.toList());
      } else {
        logLocalDS.cacheSaveItems(myitems);
      }
      return Right(CacheSuccess());
    }catch(e){
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<MyLogModel>>> getSavedItems() async  {
    var accessTokenResult = await _authLocalDS.getValorAccessToken();
    var token = accessTokenResult.fold((l) => null, (r) => r) ?? "";
    var result = await _remoteDS.getMySavedScans(token);
    result.fold((l) => null, (r) {
      logLocalDS.cacheSaveItems(r);
    });
    if(result.isRight()){
      return result;
    } else {
      var localResult = await logLocalDS.getSavedItems();
      return localResult;
    }
  }
  
  @override
  Future<Either<Failure, String>> getGathererAccessToken() async {
    try {
      var accessTokenResult = await _authLocalDS.getValorAccessToken();
      var token = accessTokenResult.fold((l) => null, (r) => r) ?? "";
      return Right(token);
    } catch(e) {
      return Left(RepositoryFailure());
    }
  }
}