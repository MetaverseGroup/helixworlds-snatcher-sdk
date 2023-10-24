import 'package:flutter_test/flutter_test.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../scan_screen_bloc_test.mocks.dart';
import 'const_temp_data_scan.dart';
import 'scan_screen_remote_datasource_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<IScanRemoteDatasource>()])
@GenerateNiceMocks([MockSpec<IScanLocalDatasource>()])

main(){
  MockDio? mDio;
  ScanRemoteDatasource? remoteDS;
  MockHelperUtil? mHelperUtil;
  
  setUp((){
    mHelperUtil = MockHelperUtil();
    mDio = MockDio();
    remoteDS = ScanRemoteDatasource(mDio!, mHelperUtil!);
  });

  group("mapping InventoryItemModel test", (){
    test("success", (){
      var result = InventoryItemModel.fromJson(scanSuccessResponse);
      expect(result.id, "1ee");
    });
  });


  group("testing getInventoryItemByID", (){
    test("success mock 1234 status code 200", () async {
      when(mHelperUtil?.getRequest(mDio, "$inventoryUrl/inventory/1234"))
      .thenAnswer((_) async {
          return Right(Response(
            requestOptions: RequestOptions(
              method: "GET",
              path: "/inventory/1234",
              data: {},
              baseUrl: inventoryUrl
            ),
            data: scanSuccessResponse,
            statusCode: 200
          ));
        },
      );
      var result = await remoteDS?.getInventoryItemByID("1234");      
      expect(result?.isRight(), true);
    });

    test("failure mock 1234 status code 404", () async {
      when(mHelperUtil?.getRequest(mDio, "$inventoryUrl/inventory/1234"))
      .thenAnswer((_) async {
          return Right(Response(
            requestOptions: RequestOptions(
              method: "GET",
              path: "/inventory/1234",
              data: {},
              baseUrl: inventoryUrl
            ),
            data: scanFailureResponse,
            statusCode: 404
          ));
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