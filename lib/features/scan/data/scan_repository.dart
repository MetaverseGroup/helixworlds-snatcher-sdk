// ignore_for_file: depend_on_referenced_packages, avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/arekognitiion_image_detector.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/failure.dart';
import 'model/scan_model.dart';

abstract class IScanRepository {

  Future<Either<Failure, InventoryItemModel>> processImage(InputImage image);
  Future<Either<Failure, InventoryItemModel>> processImageLocal(InputImage image);
  Future<Either<Failure, InventoryItemModel>> processImageAR(XFile image);
  /// pass the ID of the object detected from image detector ex. p001
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);
  Future<Either<Failure, Success>> cacheSavedItem(InventoryItemModel items);
}

class ScanRepository extends IScanRepository {
  final ARekognitionImageDetector _arImageDetector;
  final ImageDetector detector;
  final ILogLocalDatasource logLocalDS;
  final IScanRemoteDatasource _remoteDS;
  final IScanLocalDatasource _localDS;
  final HelperUtil _helperUtil;

  ScanRepository(this.detector, this.logLocalDS, this._localDS, this._remoteDS, this._helperUtil, this._arImageDetector);
  @override
  Future<Either<Failure, InventoryItemModel>> processImage(InputImage image) async {
    try {
      var result = await detector.processImage(image);
      if(result != null) {
        // this is API Based Fetch Inventory
        var inventoryItemResult = await getInventoryItemByID(result);
        return inventoryItemResult;
      } else {
        return Left(ItemNotDetectedFailure());
      }
    } catch (e) {
      return Left(ItemNotDetectedFailure());
    }
  }

  logModel(InventoryItemModel object) async {
    var logsResult = await logLocalDS.getLogs();
    List<MyLogModel> newLogs = [];
    List<MyLogModel> logs = logsResult.fold((l) => null, (r) => r) ?? [];
    newLogs.addAll(logs);
    final model = MyLogModel(
              id: object.id,
              name: object.title,
              image: object.image,
              date: _helperUtil.getDateString(),
              game: object.projectId,
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
  Future<Either<Failure, InventoryItemModel>> processImageLocal(InputImage image) async {
    try {
      var result = await detector.processImage(image);
      if(result != null) {
        // this is hard coded details 
        var model = InventoryItemModel(
          id: _helperUtil.getId(result),
          title: _helperUtil.getTitle(result),
          url: _helperUtil.getUrl(result),
          image: _helperUtil.getImage(result),
          projectId: _helperUtil.getGame(result)
        );
        logModel(model);
        return Right(model);

      } else {
        return Left(ItemNotDetectedFailure());
      }
    } catch (e) {
      return Left(ItemNotDetectedFailure());
    }
  }

  @override
  Future<Either<Failure, InventoryItemModel>> processImageAR(XFile photo) async {
    try {
      // var result = await detector.processImage(image);
      var result = await _arImageDetector.detectImage(photo);
      if(result.isNotEmpty) {
        // this is hard coded details 
        var model = InventoryItemModel(
          id: _helperUtil.getId(result),
          title: _helperUtil.getTitle(result),
          url: _helperUtil.getUrl(result),
          image: _helperUtil.getImage(result),
          projectId: _helperUtil.getGame(result)
        );
        logModel(model);
        return Right(model);

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
      var localResult = await logLocalDS.getSavedItems();
      final model = MyLogModel(
                id: items.id,
                name: items.title,
                image: items.image,
                date: _helperUtil.getDateString(),
                game: items.projectId,
                url: items.url ?? ""
      );
      List<MyLogModel> myitems = [];
      List<MyLogModel> logItems = localResult.fold((l) => null, (r) => r) ?? [];
      myitems.addAll(logItems);
      myitems.add(model);
      if(myitems.length > 10){
        logLocalDS.cacheSaveItems(myitems.reversed.toList().take(10).toList());
      } else {
        logLocalDS.cacheSaveItems(myitems);
      }
      return Right(CacheSuccess());
    }catch(e){
      return Left(CacheFailure());
    }
  }
  
}