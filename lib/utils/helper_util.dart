// ignore_for_file: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import '../core/failure.dart';

class HelperUtil {
  Future<Either<Failure, Success>> redirectUrl(Uri url,
      {String accessToken = ""}) async {
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: WebViewConfiguration(
            headers: {"Authorization": "Bearer " + accessToken}))) {
      return Left(WebRouteFailure('Could not launch ${url.path}'));
    } else {
      return Right(WebRouteSuccess());
    }
  }

  String formatDate(String dateString) {
    var date = DateTime.tryParse(dateString) ?? DateTime.now();
    return '${date.day}/${date.month}/${date.year}';
  }

  String getDateString() {
    var date = DateTime.now();
    return date.toIso8601String();
  }

  Future<Either<Failure, Response>> getRequest(Dio dio, String url) async {
    try {
      var response =
          await dio.get(url, options: Options(contentType: "application/json"));
      return Right(response);
    } catch (e) {
      return Left(HelperGetRequestFailure());
    }
  }

  String getUrl(String item) {
    if (item.contains('p001')) {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    } else if (item.contains('p002')) {
      return 'https://northboundgear.co/collections/mens-waterproof-pants/products/outdoor-waterproof-pants';
    } else if (item.contains('p003')) {
      return 'https://shop.helixworlds.io/products/mvg-t-shirt';
    } else if (item.contains("p010")) {
      return "https://www.balenciaga.com/en-ca/searchcontent?fdid=skiwear-collection";
      // return "https://www.circlek.com";
    } else if (item.contains("p008")) {
      return "https://www.balenciaga.com/en-ca/searchcontent?fdid=skiwear-collection";
    } else if (item.contains("p008")) {
      return "https://www.balenciaga.com/en-ca/searchcontent?fdid=skiwear-collection";
    } else if (item.contains("P012")) {
      return "https://gamecraftersguild.shop/products/gcg-fanny-pack";
    } else {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    }
  }

  String getTitle(String item) {
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
    } else if (item.contains('p009')) {
      return 'Polysleep Logo';
    } else if (item.contains('p010')) {
      // return 'Circle K';
      return "BALENCIAGA SKIWEAR";
    } else if (item.contains('p008')) {
      return 'Balenciaga SKIWEAR';
    } else if (item.contains('P012')) {
      return 'GCG FANNY PACK';
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
    } else if (item.contains('p010')) {
      return 'p010';
    } else if (item.contains('P012')) {
      return 'P012';
    } else {
      return '';
    }
  }

  String getGame(String item) {
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
    } else if (item.contains('p009')) {
      return 'Woolen Warfare';
    } else if (item.contains('p009')) {
      return 'Escape the Bear';
    } else if (item.contains('p010')) {
      // return 'Escape the Bear';
      return "SKIWEAR MINI GAME";
    } else if (item.contains('p008')) {
      return 'SKIWEAR';
    } else if (item.contains('P012')) {
      return 'FORTNITE';
    } else {
      return '';
    }
  }

  String getImage(String item) {
    if (item.contains('p001')) {
      return 'assets/s_cow.png';
    } else if (item.contains('p002')) {
      return 'assets/s_pants.png';
    } else if (item.contains('p003')) {
      return 'assets/s_shirt.png';
    } else if (item.contains('p004')) {
      return 'assets/s_woolen.png';
    } else if (item.contains('p005')) {
      return 'assets/s_metaverse.png';
    } else if (item.contains('p006')) {
      return 'assets/s_hulks.png';
    } else if (item.contains('p007')) {
      return 'assets/s_polysleep.png';
    }
    // else if (item.contains('p008')) {
    //   return 'assets/s_polysleep.png';
    // }
    else if (item.contains('p009')) {
      return 'assets/s_polysleep.png';
    } else if (item.contains('p010')) {
      // return 'assets/s_circlek.png';
      return 'assets/s_balenciaga_skiwear.png';
    } else if (item.contains('p008')) {
      return 'assets/s_balenciaga_skiwear.png';
    } else if (item.contains('P012')) {
      return 'assets/s_gcg.png';
    } else {
      return '';
    }
  }
}
