


import 'package:flutter_test/flutter_test.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../scan_screen_bloc_test.mocks.dart';
import 'scan_screen_remote_datasource_test.mocks.dart';
import 'scan_screen_repository_test.mocks.dart';
import 'package:dartz/dartz.dart';


@GenerateNiceMocks([MockSpec<ImageDetector>()])

main(){
  MockIScanRemoteDatasource? remoteDS;
  MockIScanLocalDatasource? localDS;
  IScanRepository? scanRepo;
  MockImageDetector? imageDetector;
  MockILogLocalDatasource? logLocalDS;
  MockInputImage? inputImage;

  setUp(() {
    remoteDS = MockIScanRemoteDatasource();
    localDS = MockIScanLocalDatasource();
    imageDetector = MockImageDetector();
    logLocalDS = MockILogLocalDatasource();
    scanRepo = ScanRepository(imageDetector!, logLocalDS!, localDS!, remoteDS!);
    inputImage = MockInputImage();
  });

  String inputId = "1234";

  group("testing method processImage", (){
    

    test("when no local data available, ", () async{

      // assumptions
      when(imageDetector?.processImage(inputImage)).thenAnswer((realInvocation) => Future.value(inputId));
      when(localDS?.fetchInventoryItemByID(inputId)).thenAnswer((inv)=> Future.value(Left(CacheFailure())));
      when(remoteDS?.getInventoryItemByID(inputId)).thenAnswer((realInvocation) => Future.value(Right(InventoryItemModel(id: inputId))));
      // process
      var result = await scanRepo?.processImage(inputImage!);
      result?.fold((l)=> null, (r){
        expect(r.id, inputId);
      });
      // expectation
      verify(localDS?.fetchInventoryItemByID(inputId)).called(1);
      verify(remoteDS?.getInventoryItemByID(inputId)).called(1);      
      expect(result?.isRight(), true);

    });

    test("when has local data available, ", () async{

      // assumptions
      when(imageDetector?.processImage(inputImage)).thenAnswer((realInvocation) => Future.value(inputId));
      when(localDS?.fetchInventoryItemByID(inputId)).thenAnswer((realInvocation) => Future.value(Right(InventoryItemModel(id: inputId))));

      // process
      var result = await scanRepo?.processImage(inputImage!);
      result?.fold((l)=> null, (r){
        expect(r.id, inputId);
      });
      // expectation
      verify(localDS?.fetchInventoryItemByID(inputId)).called(1);
      verifyNever(remoteDS?.getInventoryItemByID(inputId));      
      expect(result?.isRight(), true);

    });
    

  });
}