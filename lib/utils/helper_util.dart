import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'dart:io' as io;
import 'package:cross_file/cross_file.dart';

class HelperUtil {


  InputImage getInputImageFile(XFile photo){
    return InputImage.fromFile(io.File(photo.path));
  }
}