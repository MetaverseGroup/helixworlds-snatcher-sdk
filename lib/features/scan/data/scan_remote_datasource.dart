import 'package:app_common_modules/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:dio/dio.dart';

import '../../../core/const.dart';

abstract class IScanRemoteDatasource {
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id);

}


class ScanRemoteDatasource extends IScanRemoteDatasource {
  final Dio dio;
  ScanRemoteDatasource(this.dio);
  @override
  Future<Either<Failure, InventoryItemModel>> getInventoryItemByID(String id) async {
    // TODO: implement getInventoryItemByID
    try{
      // TODO: implement authenticate
      var response = await dio.get(inventoryUrl+"/inventory/"+id,
        options: Options(
          contentType: "application/json"
        )
      );
      if(response.statusCode == 200){
        return Right(InventoryItemModel.fromJson(response.data));
      }

      return Left(GetItemByIDRemoteFailure());
    } catch(e){
      print(e);
      return Left(GetItemByIDRemoteFailure());
    }
  } 


}