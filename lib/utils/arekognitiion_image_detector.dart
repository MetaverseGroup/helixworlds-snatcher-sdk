// ignore_for_file: depend_on_referenced_packages

import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:image_picker/image_picker.dart';


class ARekognitionImageDetector {
  final Rekognition service;
  final String projectARN;
  ARekognitionImageDetector(this.service, this.projectARN);
  
  Future<String> detectImage(XFile inputImage) async {
    try{
      var data = await inputImage.readAsBytes();
      var result = await service.detectCustomLabels(image: Image(bytes: data), projectVersionArn: projectARN);
      // print("AR RESULT");
      // print(result.customLabels?.length);
      for(var i in result.customLabels ?? []){
        // print(i.name);
        return i.name;        
      }
      return "";
    }catch(e){
      // print("ERROR");
      // print(e);
      return "";
    }
  }

}