


// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/arekognitiion_image_detector.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'scan_screen_remote_datasource_test.mocks.dart';
import 'scan_screen_repository_test.mocks.dart';
import 'package:dartz/dartz.dart';


@GenerateNiceMocks([MockSpec<ImageDetector>()])
@GenerateNiceMocks([MockSpec<ARekognitionImageDetector>()])
@GenerateNiceMocks([MockSpec<InputImage>()])
@GenerateNiceMocks([MockSpec<ILogLocalDatasource>()])

main(){
  MockIScanRemoteDatasource? remoteDS;
  MockIScanLocalDatasource? localDS;
  IScanRepository? scanRepo;
  MockImageDetector? imageDetector;
  MockARekognitionImageDetector? mARImageDetector;
  MockILogLocalDatasource? logLocalDS;
  MockInputImage? inputImage;
  MockHelperUtil? helperUtil;
  HelperUtil? rHelperUtil;
  String dateTime = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  setUp(() {
    rHelperUtil = HelperUtil();
    mARImageDetector = MockARekognitionImageDetector();
    helperUtil = MockHelperUtil();
    remoteDS = MockIScanRemoteDatasource();
    localDS = MockIScanLocalDatasource();
    imageDetector = MockImageDetector();
    logLocalDS = MockILogLocalDatasource();
    scanRepo = ScanRepository(imageDetector!, logLocalDS!, localDS!, remoteDS!, helperUtil!, mARImageDetector!);
    inputImage = MockInputImage();
  });

  String inputId = "1234";

  group("testing method processImage api based item details", (){
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


  group("testing method process local based item details", (){
    test("tshirt object", () async {
      when(imageDetector?.processImage(inputImage)).thenAnswer((realInvocation) => Future.value("p003"));
      when(logLocalDS?.getLogs()).thenAnswer((realInvocation) => Future.value(const Right([])));
      when(logLocalDS?.cacheLogs([])).thenAnswer((realInvocation) => Future.value(Right(CacheSuccess())));
      when(helperUtil?.getDateString()).thenAnswer((realInvocation) => dateTime);

      var myScanRepo = ScanRepository(imageDetector!, logLocalDS!, localDS!, remoteDS!, rHelperUtil!, mARImageDetector!);
      var result = await myScanRepo.processImageLocal(inputImage!);
      expect(result.isRight(), true);
      var rightValue = result.fold((l) => null, (r) => r);
      expect(rightValue?.title, "MVG Shirt");
    });
  });

}