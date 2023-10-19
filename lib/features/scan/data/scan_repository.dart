import 'package:app_common_modules/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';

abstract class IScanRepository {

  Future<Either<Failure, ObjectDetectedModel>> processImage(InputImage image);
}

class ScanRepository extends IScanRepository {
  final ImageDetector detector;
  ScanRepository(this.detector);
  @override
  Future<Either<Failure, ObjectDetectedModel>> processImage(InputImage image) async {
    // TODO: implement processImage
    try {
      var result = await detector.processImage(image);
      return Right(result!);
    } catch (e) {
      throw Failure();
    }
  }
}