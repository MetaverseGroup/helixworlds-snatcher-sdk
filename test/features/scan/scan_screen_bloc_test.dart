import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:mockito/annotations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'scan_screen_bloc_test.mocks.dart';
import 'package:dartz/dartz.dart';


@GenerateNiceMocks([MockSpec<IUserDetailsRepository>()])
@GenerateNiceMocks([MockSpec<ILogLocalDatasource>()])
@GenerateNiceMocks([MockSpec<IScanRepository>()])
@GenerateNiceMocks([MockSpec<ImagePicker>()])
@GenerateNiceMocks([MockSpec<InputImage>()])
@GenerateNiceMocks([MockSpec<HelperUtil>()])

main(){
  MockIUserDetailsRepository? userDetailsRepo;
  MockILogLocalDatasource? logLocaDS;
  MockIScanRepository? scanRepo;
  
  MockImagePicker? imagePicker;
  MockHelperUtil? helperUtil;
  MockInputImage mInputImage = MockInputImage();
  // InputImage image = InputImage.fromFile(io.File(photo.path));

  const InventoryItemModel objectModel = InventoryItemModel(id: "p001", title: "p001", image: "", projectId: "", url: "https://shop.helixworlds.io/products/mvg-t-shirt");
  const InventoryItemModel tshirtObjectModel = InventoryItemModel(id: "p003", title: "p003", image: "", projectId: "", url: "https://shop.helixworlds.io/products/mvg-t-shirt");

  const String userId = "1234";
  XFile file = XFile("");

  Uri tshirtPath = Uri.parse("${tshirtObjectModel.url ?? ""}?userId=$userId");
  


  setUp((){
    userDetailsRepo = MockIUserDetailsRepository();
    logLocaDS = MockILogLocalDatasource();
    scanRepo = MockIScanRepository();
    imagePicker = MockImagePicker();
    helperUtil = MockHelperUtil();
  });



  group("testing event bloc ScanScreenTakePictureEvent", (){

    blocTest<ScanScreenPageBloc, ScanScreenState>(
        'success mock data',
        build: () {
          when(imagePicker?.pickImage(source: ImageSource.camera)).thenAnswer((inv)=> Future.value(file));
          when(helperUtil?.getInputImageFile(file)).thenAnswer((inv)=> mInputImage);
          when(scanRepo?.processImage(mInputImage)).thenAnswer((inv)=> Future.value(const Right(objectModel)));
          when(userDetailsRepo?.getUserID()).thenAnswer(((inv)=> Future.value(const Right(userId))));

          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!, isLocalItemDetailsFetch: false);
        },
        act: (bloc){
          bloc.add(ScanScreenTakePictureEvent());
        },
        expect: () => [ScanScreenShowScannedObjectState(objectModel, userId)],
    );

    blocTest<ScanScreenPageBloc, ScanScreenState>(
      'tshirt model object take picture success',
      build: () {
          when(imagePicker?.pickImage(source: ImageSource.camera)).thenAnswer((inv)=> Future.value(file));
          when(helperUtil?.getInputImageFile(file)).thenAnswer((inv)=> mInputImage);
          when(scanRepo?.processImage(mInputImage)).thenAnswer((inv)=> Future.value(const Right(tshirtObjectModel)));
          when(userDetailsRepo?.getUserID()).thenAnswer(((inv)=> Future.value(const Right(userId))));
          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!, isLocalItemDetailsFetch: false);
      },
      act: (bloc){
        bloc.add(ScanScreenTakePictureEvent());
      },
      expect: () => [
        ScanScreenShowScannedObjectState(tshirtObjectModel, userId), 
      ],
    );


    blocTest<ScanScreenPageBloc, ScanScreenState>(
      'redirect to tshirtobject model url with user id p003',
      build: () {

          when(helperUtil?.redirectUrl(tshirtPath)).thenAnswer((realInvocation) => Future.value(Right(WebRouteSuccess())));
          when(userDetailsRepo?.getUserID()).thenAnswer(((inv)=> Future.value(const Right(userId))));

          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!, isLocalItemDetailsFetch: true);
      },
      act: (bloc){
        bloc.add(ScanScreenLaunchToUrlEvent(tshirtObjectModel));
      },
      expect: () => [
        ScanScreenSuccessRedirectState(tshirtPath.toString())
      ],
    );
  });





}