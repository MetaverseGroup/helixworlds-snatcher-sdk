import 'dart:io';
import 'package:app_common_modules/core/failure.dart';
import 'package:app_common_modules/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:app_common_modules/di/services_di.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';


final GetIt serviceLocator = GetIt.instance;
setupServices() async {
  _setupImagePicker();
  setupCommonModulesServices();
  _setupMLServices();
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  _setupBloc();
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
    print("ERROR SETUP IMAGE LABELER");
    print(e);
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
  print("ASSET PICKER");
  print(modelPath);
  return modelPath ?? "";
}

fetchDirectory(String dir) async {
  print("FETCH DIR");
  print(dir);
  var directory = Directory(dir);
  // List the directories in the directory.
  await for (var entity in directory.list()) {
    // If the entity is a directory, print its path.
    if (entity is Directory) {
      print("APPLICATION Support Directory");
      print("PATH");
      print(entity.path);
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
