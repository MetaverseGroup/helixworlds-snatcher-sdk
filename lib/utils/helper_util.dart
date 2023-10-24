import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'dart:io' as io;
import 'package:cross_file/cross_file.dart';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import '../core/failure.dart';


class HelperUtil {
  InputImage getInputImageFile(XFile photo){
    return InputImage.fromFile(io.File(photo.path));
  }
  Future<Either<Failure, Success>> redirectUrl(Uri url) async {
    if (!await launchUrl(url)) {
      return Left(WebRouteFailure('Could not launch ${url.toString()}'));
    }  else {
      return Right(WebRouteSuccess());
    }
  }

  Future<Either<Failure, Response>> getRequest(Dio dio, String url) async{
    try{
      var response = await dio.get(url,
        options: Options(
          contentType: "application/json"
        )
      );
      return Right(response);
    }catch(e){
      return Left(HelperGetRequestFailure());
    }
  }
}