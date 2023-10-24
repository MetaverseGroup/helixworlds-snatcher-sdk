


import 'dart:convert';

import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'model/scan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IScanLocalDatasource {
  Future<Either<Failure, Success>> cacheInventoryItem(InventoryItemModel items);
  Future<Either<Failure, InventoryItemModel>> fetchInventoryItemByID(String id);
  Future<Either<Failure, List<InventoryItemModel>>> getInventoryItems();
}

const String local_key_inventory = "local_key_inventory";

class ScanLocalDatasource extends IScanLocalDatasource {
  final SharedPreferences _sharedPref;
  ScanLocalDatasource(this._sharedPref);

  @override
  Future<Either<Failure, Success>> cacheInventoryItem(InventoryItemModel items) async {
    // TODO: implement cacheInventoryItem
    try{
      var result = await getInventoryItems();
      
      if(result.isRight()){
        var inventory = result.fold((l) => null, (r) => r) ?? [];
        if(!inventory.contains(items)){
          // does not contain the store it locally
          inventory.add(items);

          final String jsonString = jsonEncode(inventory.map((obj) => obj.toJson()).toList());
          _sharedPref.setString(local_key_inventory, jsonString);
          return Right(CacheSuccess());
        } else{
          // else do nothing
          return Right(CacheSuccess());
        }
      } else {
        return Left(CacheFailure());
      }
    }catch(e){
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<InventoryItemModel>>> getInventoryItems() async {
    // TODO: implement getInventoryItems
    try{
      var jsonResult = jsonDecode(_sharedPref.getString(local_key_inventory) ?? "");

      final List<dynamic> jsonList = jsonDecode(jsonResult);
      final List<InventoryItemModel> objects = jsonList.map((json) => InventoryItemModel.fromJson(json)).toList();
      return Right(objects);
    }catch(e){
      return const Right([]);
    }
  }
  
  @override
  Future<Either<Failure, InventoryItemModel>> fetchInventoryItemByID(String id) async {
    // TODO: implement fetchInventoryItemByID
    try{
      var result = await getInventoryItems();
      if(result.isRight()){
        var inventoryItems = result.fold((l) => null, (r) => r) ?? [];
        var inventoryItem = inventoryItems.where((element) => element.id == id).toList();
        if(inventoryItem.isNotEmpty){
          return Right(inventoryItem.first);
        } else {
          return Left(NoDataFoundFailure());
        }
      } else {
        return Left(NoDataFoundFailure());
      }
    }catch(e){
      return Left(CacheFailure());
    }
  }

}