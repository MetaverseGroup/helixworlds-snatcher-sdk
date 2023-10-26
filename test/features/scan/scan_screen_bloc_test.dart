import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
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

  const InventoryItemModel objectModel = InventoryItemModel(id: "p001", title: "p001", image: "", projectId: "", url: "");

  const ObjectDetectedModel localObjectModel = ObjectDetectedModel(id: "p001", name: "p001", image: "", game: "", marketUrl: "");

  const ObjectDetectedModel tShirtobjectModel = ObjectDetectedModel(id: "p003", name: "p003", image: "", game: "", marketUrl: "https://shop.helixworlds.io/products/mvg-t-shirt");
  const String userId = "1234";
  XFile file = XFile("");
  
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

        return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
      },
      act: (bloc){
        bloc.add(ScanScreenTakePictureEvent());
      },
      expect: () => [ScanScreenShowScannedObjectState(objectModel, userId)],
    );
    
    blocTest<ScanScreenPageBloc, ScanScreenState>(
            'success take picture event',
            build: () {
              when(helperUtil?.redirectUrl(Uri(path:any))).thenAnswer((inv)=>Future.value(Right(RedirectWebSuccess())));

              when(imagePicker?.pickImage(source: ImageSource.camera)).thenAnswer((inv)=> Future.value(file));

              when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right(userId)));
              when(helperUtil?.getInputImageFile(file)).thenAnswer((inv)=> mInputImage);

              when(scanRepo?.processImage(mInputImage)).thenAnswer((inv)=> Future.value(const Right(objectModel)));

              return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);


            },
            act: (bloc){
              bloc.add(ScanScreenTakePictureEvent());
              bloc.add(ScanScreenLaunchToUrlEvent(tShirtobjectModel));
            },
            expect: () => [ScanScreenShowScannedObjectState(objectModel, userId)],
        );


        blocTest<ScanScreenPageBloc, ScanScreenState>(
            'success scan tshirt object model',
            build: () {

              when(helperUtil?.redirectUrl(Uri(path:any))).thenAnswer((inv)=>Future.value(Right(RedirectWebSuccess())));

              when(imagePicker?.pickImage(source: ImageSource.camera)).thenAnswer((inv)=> Future.value(file));

              when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right(userId)));
              when(helperUtil?.getInputImageFile(file)).thenAnswer((inv)=> mInputImage);

              when(scanRepo?.processImage(mInputImage)).thenAnswer((inv)=> Future.value(const Right(tShirtobjectModel)));

              return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
            },
            act: (bloc){
              bloc.add(ScanScreenTakePictureEvent());
              bloc.add(ScanScreenLaunchToUrlEvent(tShirtobjectModel));
            },
            expect: () => [
              ScanScreenShowScannedObjectState(tShirtobjectModel, userId), ScanScreenSuccessRedirectState("${tShirtobjectModel.marketUrl}?userId$userId")
            ],
        );

  });

  group("testing event bloc ScanScreenViewLogsEvent", (){
      blocTest<ScanScreenPageBloc, ScanScreenState>(
        'success mock data empty list',
        build: () {
          when(logLocaDS?.getLogs()).thenAnswer((inv)=> Future.value(const Right([])));
          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
        },
        act: (bloc){
          bloc.add(ScanScreenViewLogsEvent());
        },
        expect: () => [ScanScreenLoadingState(), ScanScreenViewLogsState([])],
      );
  });

   group("testing event bloc ScanScreenRedirectToUrlEvent", (){
      blocTest<ScanScreenPageBloc, ScanScreenState>(
        'success redirect',
        build: () {
          when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right("1234")));
          when(helperUtil?.redirectUrl(Uri.parse("https://test?userId=1234")))
          .thenAnswer((realInvocation) => Future.value(Right(WebRouteSuccess())));

          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
        },
        act: (bloc){
          bloc.add(ScanScreenRedirectToUrlEvent("https://test"));
        },
        expect: () => [],
      );

      blocTest<ScanScreenPageBloc, ScanScreenState>(
        'failure redirect url not found error',
        build: () {
          when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right("1234")));
          when(helperUtil?.redirectUrl(Uri.parse("https://test?userId=1234")))
          .thenAnswer((realInvocation) => Future.value(Left(WebRouteFailure(""))));

          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
        },
        act: (bloc){
          bloc.add(ScanScreenRedirectToUrlEvent("https://test"));
        },
        expect: () => [ScanScreenFailure("Url not found")],
      );
  });

  group("testing event bloc ScanScreenLaunchToUrlEvent", (){
      blocTest<ScanScreenPageBloc, ScanScreenState>(
        'success mock data item model',
        build: () {
          when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right("1234")));
          when(helperUtil?.redirectUrl(Uri.parse("https://test?userId=1234")))
          .thenAnswer((realInvocation) => Future.value(Right(WebRouteSuccess())));
          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
        },
        act: (bloc){
          bloc.add(ScanScreenLaunchToUrlEvent(
            const InventoryItemModel(url: "https://test")
          ));
        },
        expect: () => [],
      );

      blocTest<ScanScreenPageBloc, ScanScreenState>(
        'failure mock data item model',
        build: () {
          when(userDetailsRepo?.getUserID()).thenAnswer((inv)=> Future.value(const Right("1234")));
          when(helperUtil?.redirectUrl(Uri.parse("https://test?userId=1234")))
          .thenAnswer((realInvocation) => Future.value(Left(WebRouteFailure("test"))));
          return ScanScreenPageBloc(userDetailsRepo!, logLocaDS!, scanRepo!,  imagePicker!, helperUtil!);
        },
        act: (bloc){
          bloc.add(ScanScreenLaunchToUrlEvent(
            const InventoryItemModel(url: "https://test")
          ));
        },
        expect: () => [ScanScreenFailure("Url not found")],
      );
  });


}