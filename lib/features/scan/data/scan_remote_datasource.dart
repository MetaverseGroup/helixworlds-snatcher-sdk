// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';

import '../../../core/const.dart';

abstract class IScanRemoteDatasource {
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);

}


class ScanRemoteDatasource extends IScanRemoteDatasource {
  final Dio dio;
  final HelperUtil _helperUtil;
  ScanRemoteDatasource(this.dio, this._helperUtil);
  @override
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id) async {
    try{
      var reponseResult = await _helperUtil.getRequest(dio, "$inventoryUrl/inventory/$id");
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
      return Left(GetItemByIDRemoteFailure());
    }
  } 


}