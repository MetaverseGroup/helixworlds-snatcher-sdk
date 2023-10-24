import 'package:flutter/services.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

// import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
// import 'package:helixworlds_snatcher_sdk/utils/object_image.dart';
// import 'package:helixworlds_snatcher_sdk/utils/object_url.dart';

class ImageDetector {
  final ImageLabeler _labeler;
  ImageDetector(this._labeler) ;


  Future<String?> processImage(InputImage inputImage) async {
    final labels = await _labeler.processImage(inputImage);
    // ignore: unused_local_variable
    String text = 'Labels found: ${labels.length}\n\n';

    if (labels.isEmpty) {
      return null;
    }

    return labels.first.label;
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

  Future<void> _initialize() async {
    // uncomment next line if you want to use the default model
    // _imageLabeler = ImageLabeler(options: ImageLabelerOptions());

    // uncomment next lines if you want to use a local model
    // make sure to add tflite model to assets/ml
    // final path = 'assets/ml/lite-model_aiy_vision_classifier_birds_V1_3.tflite';
    // const path = 'assets/model.tflite';
    // final modelPath = await _getModel(path);
    // final options = LocalLabelerOptions(modelPath: modelPath);
    // _imageLabeler = ImageLabeler(options: options);


    // uncomment next lines if you want to use a remote model
    // make sure to add model to firebase
    // final modelName = 'bird-classifier';
    // final response =
    //     await FirebaseImageLabelerModelManager().downloadModel(modelName);
    // print('Downloaded: $response');
    // final options =
    //     FirebaseLabelerOption(confidenceThreshold: 0.5, modelName: modelName);
    // _imageLabeler = ImageLabeler(options: options);
  }

  Future<String> _getModel(String assetPath) async {
    // if (io.Platform.isAndroid) {
    //   return 'flutter_assets/$assetPath';
    // }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  String _getTitle(String item) {
    if (item.contains('p001')) {
      return 'Ultimate Cow';
    } else if (item.contains('p002')) {
      return 'Waterproof Pants';
    } else if (item.contains('p003')) {
      return 'MVG Shirt';
    } else if (item.contains('p004')) {
      return 'Woolen Warfare';
    } else if (item.contains('p005')) {
      return 'Metaverse Group';
    } else if (item.contains('p006')) {
      return 'Hulk Labs';
    } else if (item.contains('p007')) {
      return 'Polysleep';
    } else if (item.contains('p008')) {
      return 'Polysleep Maple Fortnite';
    } else if (item.contains('p009')) {
      return 'Polysleep Logo';
    } else if (item.contains('p010')) {
      return 'Circle K';
    } else {
      return '';
    }
  }

  String _getId(String item) {
    if (item.contains('p001')) {
      return 'p001';
    } else if (item.contains('p002')) {
      return 'p002';
    } else if (item.contains('p003')) {
      return 'p003';
    } else if (item.contains('p004')) {
      return 'p004';
    } else if (item.contains('p005')) {
      return 'p005';
    } else if (item.contains('p006')) {
      return 'p006';
    } else if (item.contains('p007')) {
      return 'p007';
    } else if (item.contains('p008')) {
      return 'p008';
    } else if (item.contains('p009')) {
      return 'p009';
    } else if(item.contains('p010')) {
      return 'p010';
    } else {
      return '';
    }
  }

  String _getGame(String item) {
    if (item.contains('p001')) {
      return 'Fortnite';
    } else if (item.contains('p002')) {
      return 'Escape the Bear';
    } else if (item.contains('p003')) {
      return 'Escape the Bear';
    } else if (item.contains('p004')) {
      return 'Woolen Warfare';
    } else if (item.contains('p005')) {
      return 'Woolen Warfare';
    } else if (item.contains('p006')) {
      return 'Woolen Warfare';
    } else if (item.contains('p007')) {
      return 'Woolen Warfare';
    } else if (item.contains('p008')) {
      return 'Woolen Warfare';
    } else if (item.contains('p009')) {
      return 'Woolen Warfare';
    } else if (item.contains('p009')) {
      return 'Escape the Bear';
    } else if(item.contains('p010')) {
      return 'Escape the Bear';
    } else {
      return '';
    }
  }
}
