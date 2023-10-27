// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:app_common_modules/di/services_di.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
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

const String sentry_dsn = "https://891ca197d27341cbd2c2a92fc2990d18@o4506103178723328.ingest.sentry.io/4506103180427264";

final GetIt serviceLocator = GetIt.instance;
setupServices() async {
  _setupImagePicker();
  _setupHelper();
  setupCommonModulesServices();
  _setupMLServices();
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  _setupBloc();
}

_setupHelper(){
  serviceLocator.registerLazySingleton(()=> SentryUtil());
}
SentryUtil getSentryUtil(){
  return serviceLocator<SentryUtil>();
}


/// call this in main 
/// 
/// MaterialApp(
///  navigatorObservers: [
///    SentryNavigatorObserver(),
///  ],
///)
setupSentry(Widget widget) async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = sentry_dsn;
        options.tracesSampleRate = 1.0;
      },
    );
    runApp(widget);
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
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
  return geSharedPref();
}

Dio _getDio(){
  return getNetworkUtil().getDio(isDebug: true);
}

Future<Either<Failure, Success>> _setupMLServices() async {
  try{
    final byteData = await rootBundle.load("packages/helixworlds_snatcher_sdk/assets/model.tflite");
    final path = '${(await getTemporaryDirectory()).path}/model.tflite';
    final tfFile = File(path);
    await tfFile.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    final modelPath = tfFile.path;
    final options = LocalLabelerOptions(modelPath: modelPath);
    serviceLocator.registerLazySingleton(() => ImageLabeler(options: options));
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

fetchDirectory(String dir) async {
  var directory = Directory(dir);
  // List the directories in the directory.
  await for (var entity in directory.list()) {
    // If the entity is a directory, print its path.
    if (entity is Directory) {

    }
  }
}

checkDir(){
  fetchDirectory("/data/user/0/com.example.example/");
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
UserDetailsRepository getUserDetailsRepo(){
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
