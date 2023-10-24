import 'package:app_common_modules/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';

import '../../../core/failure.dart';
import 'model/scan_model.dart';

abstract class IScanRepository {

  Future<Either<Failure, InventoryItemModel>> processImage(InputImage image);
  /// pass the ID of the object detected from image detector ex. p001
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);
}

class ScanRepository extends IScanRepository {
  final ImageDetector detector;
  final ILogLocalDatasource logLocalDS;
  final IScanRemoteDatasource _remoteDS;
  final IScanLocalDatasource _localDS;

  ScanRepository(this.detector, this.logLocalDS, this._localDS, this._remoteDS);
  @override
  Future<Either<Failure, InventoryItemModel>> processImage(InputImage image) async {
    // TODO: implement processImage
    try {
      print("Processing image");
      var result = await detector.processImage(image);
      if(result != null){
        // _logModel(result);        
        var inventoryItemResult = await getInventoryItemByID(result);
        return inventoryItemResult;
      } else {
        return Left(ItemNotDetectedFailure());
      }
    } catch (e) {
      print("ERROR Processing image");
      print(e);
      return Left(ItemNotDetectedFailure());
    }
  }

  String _getDateString() {
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  }

  _logModel(InventoryItemModel object) async {
    var logsResult = await logLocalDS.getLogs();
    var logs = logsResult.fold((l) => null, (r) => r) ?? [];
    final model = MyLogModel(
              id: object.id,
              name: object.title,
              image: object.image,
              date: _getDateString(),
              game: object.projectId
    );
    logs.add(model);
    logLocalDS.cacheLogs(logs);
  }
  
  @override
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id) async {
    // TODO: implement getInventoryItemByID
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
}