// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'const_temp_data_scan.dart';
import 'scan_screen_remote_datasource_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<IScanRemoteDatasource>()])
@GenerateNiceMocks([MockSpec<HelperUtil>()])
@GenerateNiceMocks([MockSpec<IScanLocalDatasource>()])

main(){
  MockIScanRemoteDatasource? remoteDS;
  
  setUp((){
    WidgetsFlutterBinding.ensureInitialized();
    remoteDS = MockIScanRemoteDatasource();
  });

  group("mapping InventoryItemModel test", (){
    test("success", () async{
      try{
        var jsonData = await scanSuccessResponse;
        var result = InventoryItemModel.fromJson(
          jsonDecode(
            jsonData
          )
        );
        expect(result.id, "1ee");
      }catch(e){
        expect(null, false);
      }
    });
  });

  group("testing getInventoryItemByID", (){
    test("success mock 1ee status code 200", () async {
      var jsonData = await scanSuccessResponse;
      when(remoteDS?.getInventoryItemByID("1ee"))
      .thenAnswer((_) async {
          return Right(InventoryItemModel.fromJson(jsonDecode(
            jsonData
          )));
        },
      );
      var result = await remoteDS?.getInventoryItemByID("1ee");      
      expect(result?.isRight(), true);
    });
    test("success mock 1ee status code 201", () async {
      var jsonData = await scanSuccessUGCResponse;
      when(remoteDS?.getInventoryItemByID("1ee"))
      .thenAnswer((_) async {
          return Right(InventoryItemModel.fromJson(jsonDecode(
            jsonData
          )));
        },
      );
      var result = await remoteDS?.getInventoryItemByID("1ee");      
      expect(result?.isRight(), true);
    });

    test("failure mock 1234 status code 404", () async {
      when(remoteDS?.getInventoryItemByID("1234"))
      .thenAnswer((_) async {
        return Left(GetItemByIDRemoteFailure());
        },
      );
      var result = await remoteDS?.getInventoryItemByID("1234");      
      expect(result?.isLeft(), true);
      result?.fold((l) {
        expect(l is GetItemByIDRemoteFailure, true);
      }, (r) => null);
    });

  });
}