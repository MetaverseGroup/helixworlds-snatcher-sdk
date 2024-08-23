// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/sentry_util.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/const.dart';

abstract class IScanRemoteDatasource {
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);
  /// this will upload the image and the scanned service will return the inventory details of the object scanned
  Future<Either<Failure, String>> objectScanned(XFile photo, String accessToken);
  Future<Either<Failure, InventoryItemModel>> objectScannedV2(XFile photo, String accessToken);

  Future<Either<Failure, List<MyLogModel>>> getMySavedScans(String accessToken);
  Future<Either<Failure, MyLogModel>> newSavedScans(String token, MyLogModel model);
  Future<Either<Failure, Success>> deleteSavedScans(String token, String id);
}


class ScanRemoteDatasource extends IScanRemoteDatasource {
  final Dio dio;
  final HelperUtil _helperUtil;
  final SentryUtil _sentryUtil;
  ScanRemoteDatasource(this.dio, this._helperUtil, this._sentryUtil);
  @override
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id) async {
    try{
      var reponseResult = await _helperUtil.getRequest(dio, "$inventoryUrl/api/inventory/$id/info");
      var response = reponseResult.fold((l) => null, (r) => r);
      if(reponseResult.isRight()) {
        if(response?.statusCode == 200){
          return Right(InventoryItemModel.fromJson(response?.data));
        }
        return Left(GetItemByIDRemoteFailure());
      } else {
        var leftValue = reponseResult.fold((l)=> l, (r)=>null);
        return Left(leftValue!);
      }
    } catch(e){
      _sentryUtil.captureException(e);
      return Left(GetItemByIDRemoteFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> objectScanned(XFile photo, String accessToken) async {
    try{
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(photo.path, filename: photo.name),
        });
        final options = Options(headers: {
          "Authorization": "Bearer $accessToken",
        });
        final response = await dio.post(
          '$baseUrl/v2/scanner/scan_image',
          options: options,
          data: formData,
        );
        if (response.statusCode == 201) {
          return Right(response.data["data"].toString());
        } else {
          return Left(GetItemByIDRemoteFailure());
        }
    } catch(e) {
      _sentryUtil.captureException(e);
      return Left(GetItemByIDRemoteFailure());
    }
  }
  
  @override
  Future<Either<Failure, Success>> deleteSavedScans(String token, String id) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
      };
      dio.options.headers['Authorization'] = 'Bearer $token'; // replace <your-access-token> with your actual token
      final options = Options(headers: headers);
      var response = await dio.delete("$valorUrl/saved-scanns/delete/$id", 
                                    options: options,
      );
      if(response.statusCode == 200){
        return Right(DataDeletionSuccess());
      } else {
        return Left(DataDeletionFailure());
      }
    } catch(e){
      _sentryUtil.captureException(e);
      return Left(ServiceFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<MyLogModel>>> getMySavedScans(String accessToken) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
      };
      dio.options.headers['Authorization'] = 'Bearer $accessToken'; // replace <your-access-token> with your actual token
      final options = Options(headers: headers);
      var response = await dio.get("$valorUrl/saved-scanns/list", 
                                    options: options,
      );
      List<MyLogModel> savedScans = (response.data as List).map((json) => MyLogModel.fromJson(json as Map<String, dynamic>)).toList();
      return Right(savedScans);
    } catch(e){
      _sentryUtil.captureException(e);
      return Left(ServiceFailure());
    }
  }
  
  @override
  Future<Either<Failure, MyLogModel>> newSavedScans(String token, MyLogModel model) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
      };
      dio.options.headers['Authorization'] = 'Bearer $token'; // replace <your-access-token> with your actual token
      final options = Options(headers: headers);
      var response = await dio.post("$valorUrl/saved-scanns", 
                                    options: options,
                                    data: model.toJson()
      );
      if(response.statusCode == 201){
        return Right(MyLogModel.fromJson(response.data));
      } else {
        return Left(ServiceFailure());
      }
    } catch(e){
      _sentryUtil.captureException(e);
      return Left(ServiceFailure());
    }
  }
  
  @override
  Future<Either<Failure, InventoryItemModel>> objectScannedV2(XFile photo, String accessToken) async {
    try{
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(photo.path, filename: photo.name),
        });
        final options = Options(headers: {
          "Authorization": "Bearer $accessToken",
        });
        final response = await dio.post(
          '$baseUrl/v3/scanner/scan_image',
          options: options,
          data: formData,
        );
        if(response.statusCode == 201) {
          return Right(InventoryItemModel.fromJson(response.data));
        }
        else if(response.statusCode == 200) {
          return Right(InventoryItemModel.fromJson(jsonDecode(response.data["data"])));
        } else {
          return Left(GetItemByIDRemoteFailure());
        }
        // if (response.statusCode == 201) {
        //   return Right(response.data["data"].toString());
        // } else {
          // return Left(GetItemByIDRemoteFailure());
        // }
    } catch(e) {
      _sentryUtil.captureException(e);
      return Left(GetItemByIDRemoteFailure());
    }
  }




}