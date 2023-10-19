import 'dart:io';

import 'package:app_common_modules/di/services_di.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'dart:io' as io;


setupServices(String path) async {
  setupCommonModulesServices();
  _setupMLServices(path);
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  await _setupBloc();
}

SharedPreferences _getSharedPref(){
  return geSharedPref();
}

Dio _getDio(){
  return getNetworkUtil().getDio(isDebug: true);
}

_setupMLServices(String path) async {
  try{
    serviceLocator.registerLazySingleton(() => ImageDetector());
    const mpath = 'assets/model.tflite';
    final modelPath = await _getApplicationPath(mpath);
    await io.Directory(dirname(mpath)).create(recursive: true);

    final options = LocalLabelerOptions(modelPath: modelPath);
    serviceLocator.registerLazySingleton(() => ImageLabeler(options: options));
  }catch(e){
    print("ERROR SETUP IMAGE LABELER");
    print(e);
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
  // fetchDirectory(result.path);
  // fetchDirectory("/data/user/0/com.example.example/");
  // fetchDirectory("/data/user/0/com.example.example/app_flutter/");
  fetchDirectory("/data/user/0/com.example.example/app_flutter/flutter_assets/");

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

UserDetailsLocalDatasource _getUserDetailsLocal(){
  return serviceLocator<UserDetailsLocalDatasource>();
}
UserDetailsRemoteDatasource _getUserDetailsRemote(){
  return serviceLocator<UserDetailsRemoteDatasource>();
}
UserDetailsRepository getUserDetailsRepo(){
  return serviceLocator<UserDetailsRepository>();
}



_setupScanServices(){
  serviceLocator.registerLazySingleton(() => ScanRepository(getImageDetector(), getLogLocalDS()));
}
ScanRepository scanRepository(){
  return serviceLocator<ScanRepository>();
}

_setupLogService(){
  serviceLocator.registerLazySingleton(() => LogLocalDatasource(_getSharedPref()));
}

LogLocalDatasource getLogLocalDS(){
  return serviceLocator<LogLocalDatasource>();
}





/// bloc DI
_setupBloc(){
  
}
