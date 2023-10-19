import 'package:app_common_modules/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';

import '../../../core/failure.dart';

abstract class IScanRepository {

  Future<Either<Failure, ObjectDetectedModel>> processImage(InputImage image);
}

class ScanRepository extends IScanRepository {
  final ImageDetector detector;
  final ILogLocalDatasource logLocalDS;

  ScanRepository(this.detector, this.logLocalDS);
  @override
  Future<Either<Failure, ObjectDetectedModel>> processImage(InputImage image) async {
    // TODO: implement processImage
    try {
      var result = await detector.processImage(image);
      print("Scanned objects");
      print(result);
      if(result != null){
        _logModel(result);
        return Right(result);
      } else {
        return Left(ItemNotDetectedFailure());
      }
    } catch (e) {
      return Left(ItemNotDetectedFailure());
    }
  }
  String _getDateString() {
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  }
  _logModel(ObjectDetectedModel object) async {
    var logsResult = await logLocalDS.getLogs();
    var logs = logsResult.fold((l) => null, (r) => r) ?? [];
    final model = MyLogModel(
              id: object.id,
              name: object.name,
              image: object.image,
              date: _getDateString(),
              game: 'Escape the bear'
    );
    logs.add(model);
    logLocalDS.cacheLogs(logs);

  }
}