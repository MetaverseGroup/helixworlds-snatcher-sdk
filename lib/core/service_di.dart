import 'package:app_common_modules/di/services_di.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'dart:io' as io;
import 'const.dart';

SharedPreferences? _sharedPref;

setupServices() async {
  _sharedPref = await SharedPreferences.getInstance();
  setupAssets();
  setupCommonModulesServices();
  _setupMLServices();
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  _setupBloc();
}

SharedPreferences _getSharedPref(){
  return _sharedPref!;
}

Dio _getDio(){
  return getNetworkUtil().getDio(isDebug: true);
}

_setupMLServices() async {
  serviceLocator.registerLazySingleton(() => ImageDetector());
  const path = 'assets/model.tflite';
  final modelPath = await _getApplicationPath(path);
  await io.Directory(dirname(path)).create(recursive: true);
  final options = LocalLabelerOptions(modelPath: modelPath);
  serviceLocator.registerLazySingleton(() => ImageLabeler(options: options));
}
ImageLabeler getImageLabler(){
  return serviceLocator<ImageLabeler>();
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
  serviceLocator.registerLazySingleton(() => ScanRepository(getImageDetector()));
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
