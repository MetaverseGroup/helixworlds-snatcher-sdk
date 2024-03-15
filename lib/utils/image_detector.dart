import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';



// import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
// import 'package:helixworlds_snatcher_sdk/utils/object_image.dart';
// import 'package:helixworlds_snatcher_sdk/utils/object_url.dart';

class ImageDetector {
  final ImageLabeler _labeler;
  ImageDetector(this._labeler) ;


  Future<String?> processImage(InputImage inputImage) async {
    try{
      final labels = await _labeler.processImage(inputImage);
      // ignore: unused_local_variable
      String text = 'Labels found: ${labels.length}\n\n';

      if (labels.isEmpty) {
        return null;
      }
      return labels.first.label;
    }catch(e){
      return "";
    }
    // if (labels.first.confidence < 50) {
    //   return null;
    // }

    // for (final label in labels) {
    //   text += 'Label: ${label.label}, '
    //       'Confidence: ${label.confidence.toStringAsFixed(2)}\n\n';
    // }

    // final object = ObjectDetectedModel(
    //     id: _getId(labels.first.label),
    //     image: ObjectImage.getImage(labels.first.label),
    //     name: _getTitle(labels.first.label),
    //     marketUrl: ObjectUrl.getUrl(
    //       labels.first.label,
    //     ),
    //     game: _getGame(labels.first.label));

    // return object;
  }





}
