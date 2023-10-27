// ignore_for_file: depend_on_referenced_packages

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
      return Left(WebRouteFailure('Could not launch ${url.path}'));
    }  else {
      return Right(WebRouteSuccess());
    }
  }

  String getDateString(){
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
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

  String getUrl(String item){
    if (item.contains('p001')) {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    } else if (item.contains('p002')) {
      return 'https://northboundgear.co/collections/mens-waterproof-pants/products/outdoor-waterproof-pants';
    } else if (item.contains('p003')) {
      return 'https://shop.helixworlds.io/products/mvg-t-shirt';
    } else if(item.contains("p010")) {
      return "https://www.circlek.com";
    } else {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    }
  }

  String getTitle(String item){
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

  String getId(String item) {
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

  String getGame(String item){
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

  String getImage(String item){
    if (item.contains('p001')) {
      return 's_cow.svg';
    } else if (item.contains('p002')) {
      return 's_pants.svg';
    } else if (item.contains('p003')) {
      return 's_shirt.svg';
    } else if (item.contains('p004')) {
      return 's_woolen.svg';
    } else if (item.contains('p005')) {
      return 's_metaverse.svg';
    } else if (item.contains('p006')) {
      return 's_hulks.svg';
    } else if (item.contains('p007')) {
      return 's_polysleep.svg';
    } else if (item.contains('p008')) {
      return 's_polysleep.svg';
    } else if (item.contains('p009')) {
      return 's_polysleep.svg';
    } else if(item.contains('p010')){
      return 's_circle_k.svg';
    } else {
      return '';
    }
  }

}