// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/theme/bloc/theme_bloc.dart';
import 'package:helixworlds_snatcher_sdk/theme/theme_helper.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/network_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/pref_utils.dart';
import 'package:helixworlds_snatcher_sdk/utils/sentry_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

const String sentry_dsn = "https://891ca197d27341cbd2c2a92fc2990d18@o4506103178723328.ingest.sentry.io/4506103180427264";

final GetIt serviceLocator = GetIt.instance;

SharedPreferences? _sharedPref;

NetworkUtil getNetworkUtil(){
  return serviceLocator<NetworkUtil>();
}

setupServices(LocalLabelerOptions labelerOption) async {
  _sharedPref = await SharedPreferences.getInstance();
  SimpleConnectionChecker checker = SimpleConnectionChecker();
  serviceLocator.registerLazySingleton(() => NetworkUtil(checker));
  serviceLocator.allowReassignment = true;
  _setupSentry();
  _setupImagePicker();
  _setupHelper();
  serviceLocator.registerLazySingleton(() => PrefUtils(_getSharedPref()));
  serviceLocator.registerLazySingleton(() => ThemeBloc(ThemeState(
          themeType: getPrefUtils().getThemeData(),
  )));
  _setupMLServices(labelerOption);
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  _setupBloc();
}

_setupSentry() async {
  await SentryFlutter.init(
      (options) {
        options.dsn = sentry_dsn;
        options.tracesSampleRate = 1.0;
      },
  );
}

_setupHelper(){
  serviceLocator.registerLazySingleton(()=> SentryUtil());
}
SentryUtil getSentryUtil(){
  return serviceLocator<SentryUtil>();
}

ThemeBloc getThemeBloc(){
  return serviceLocator<ThemeBloc>();
}

PrefUtils getPrefUtils(){
  return serviceLocator<PrefUtils>();
}

PrimaryColors get appTheme => ThemeHelper(getPrefUtils()).themeColor();
ThemeData get theme => ThemeHelper(getPrefUtils()).themeData();



/// call this in main 
/// 
/// MaterialApp(
///  navigatorObservers: [
///    SentryNavigatorObserver(),
///  ],
///)

void captureException(Object exception, StackTrace stackTrace) async {
  await Sentry.captureException(exception, stackTrace: stackTrace);
}


void verifyIfSentryIsWorking() async {
  try {
    throw CacheFailure;
  } catch (exception, stackTrace) {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }
}

_setupImagePicker(){
  serviceLocator.registerLazySingleton(() => ImagePicker());
  serviceLocator.registerLazySingleton(() => HelperUtil());
}

ImagePicker getImagePicker(){
  return serviceLocator<ImagePicker>();
}
HelperUtil getHelperUtil(){
  return serviceLocator<HelperUtil>();
}



SharedPreferences _getSharedPref(){
  return _sharedPref!;
}

Dio _getDio(){
  return getNetworkUtil().getDio(isDebug: true);
}

Future<Either<Failure, Success>> _setupMLServices(LocalLabelerOptions option) async {
  try{
    // final byteData = await rootBundle.load("packages/helixworlds_snatcher_sdk/assets/model-2.tflite");
    // final path = '${(await getTemporaryDirectory()).path}/model-2.tflite';
    // final tfFile = File(path);
    // await tfFile.writeAsBytes(byteData.buffer
    //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    // final modelPath = tfFile.path;
    // final options = LocalLabelerOptions(modelPath: modelPath);
    serviceLocator.registerLazySingleton(() => ImageLabeler(options: option));
    serviceLocator.registerLazySingleton(() => ImageDetector(getImageLabler()));
    return Right(SetupDISuccess());
  }catch(e){
    return Left(SetupServiceFailure());
  }
}



ImageLabeler getImageLabler(){
  return serviceLocator<ImageLabeler>();
}

String assetPicker(String path) {
  String? modelPath = "";
  _getApplicationPath(path).then((s){
    modelPath = s;
  });
  return modelPath ?? "";
}


Future<String> _getApplicationPath(String path) async {
  var result = await getApplicationSupportDirectory();
  return "${result.path}/$path";
}

ImageDetector getImageDetector(){
  return serviceLocator<ImageDetector>();
}

_setupUserDetailsServices(){
  serviceLocator.registerLazySingleton(() => UserDetailsLocalDatasource(_getSharedPref()));  
  serviceLocator.registerLazySingleton(() => UserDetailsRemoteDatasource(_getDio()));
  serviceLocator.registerLazySingleton(() => UserDetailsRepository(_getUserDetailsLocal(), _getUserDetailsRemote()));
}

IUserDetailsLocalDatasource _getUserDetailsLocal(){
  return serviceLocator<UserDetailsLocalDatasource>();
}
IUserDetailsRemoteDatasource _getUserDetailsRemote(){
  return serviceLocator<UserDetailsRemoteDatasource>();
}
IUserDetailsRepository getUserDetailsRepo(){
  return serviceLocator<UserDetailsRepository>();
}

_setupScanServices(){
  serviceLocator.registerLazySingleton(() => ScanRemoteDatasource(_getDio(), getHelperUtil()));
  serviceLocator.registerLazySingleton(() => ScanLocalDatasource(_getSharedPref()));
  serviceLocator.registerLazySingleton(() => ScanRepository(getImageDetector(), getLogLocalDS(), _getScanLocalDS(), _getScanRemoteDS(), getHelperUtil()));
}

IScanRemoteDatasource _getScanRemoteDS(){
  return serviceLocator<ScanRemoteDatasource>();
}
IScanLocalDatasource _getScanLocalDS(){
  return serviceLocator<ScanLocalDatasource>();
}

ScanRepository scanRepository(){
  return serviceLocator<ScanRepository>();
}

_setupLogService(){
  serviceLocator.registerLazySingleton(() => LogLocalDatasource(_getSharedPref()));
}

ILogLocalDatasource getLogLocalDS(){
  return serviceLocator<LogLocalDatasource>();
}





/// bloc DI
_setupBloc(){
  
}
