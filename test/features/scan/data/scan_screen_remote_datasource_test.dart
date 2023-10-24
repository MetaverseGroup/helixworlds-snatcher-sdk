import 'package:flutter_test/flutter_test.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

import 'const_temp_data_scan.dart';
import 'scan_screen_remote_datasource_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<IScanRemoteDatasource>()])
@GenerateNiceMocks([MockSpec<IScanLocalDatasource>()])

main(){
  MockDio? mDio;
  ScanRemoteDatasource? remoteDS;
  
  setUp((){
    mDio = MockDio();
    remoteDS = ScanRemoteDatasource(mDio!);
  });

  group("mapping InventoryItemModel test", (){
    test("success", (){
      var result = InventoryItemModel.fromJson(scanSuccessResponse);
      expect(result.id, "1ee");
    });
  });


  group("testing getInventoryItemByID", (){

    test("success 1234", () async {
      
      // when(mDio?.get(inventoryUrl+"/inventory/1234")).thenAnswer((inv){
      //     return Future.value(Response(
      //       requestOptions: RequestOptions(path: inventoryUrl+"/inventory/1234"),
      //       data: scanSuccessResponse,
      //       statusCode: 200
      //     ));
      //   },
      // );
      // var result = await remoteDS?.getInventoryItemByID("1234");
      // expect(result?.isRight(), true);
    });

  });
}