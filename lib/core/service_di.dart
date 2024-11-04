// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_googleanalytics_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_mixpanels_rudderstack_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_remote_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/helixworlds_sdk.dart';
import 'package:helixworlds_snatcher_sdk/theme/bloc/theme_bloc.dart';
import 'package:helixworlds_snatcher_sdk/theme/theme_helper.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/network_util.dart';
import 'package:helixworlds_snatcher_sdk/utils/pref_utils.dart';
import 'package:helixworlds_snatcher_sdk/utils/sentry_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:dio/dio.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

GetIt? serviceLocator;
setupServiceLocator() {
  try {
    serviceLocator = GetIt.instance;
  } catch (e) {
    serviceLocator = GetIt.instance;
  }
}

SharedPreferences? _sharedPref;

NetworkUtil getNetworkUtil() {
  return serviceLocator!<NetworkUtil>();
}

String myProjectARN = "";

/// mixPanelToken -> used for analytics tracking purposes
/// arRegion, arAccessKey, arSecretKey, projectARN -> this data is fetched if you setup amazon rekognition and utilized the cloud image labeling
/// rudderStackKey -> fetch this when you have access to your rudderstack, rudderPlaneUrl and rudderControlPlaneUrl
/// isLocal -> this will be used to identify if it will

setupServices(
    {String mixPanelToken = "",
    String arRegion = "",
    String arAccessKey = "",
    String arSecretKey = "",
    String projectARN = "",
    String sentryDSN =
        "https://891ca197d27341cbd2c2a92fc2990d18@o4506103178723328.ingest.sentry.io/4506103180427264",
    String rudderStackKey = "",
    String rudderPlaneUrl = "https://rudderstacgwyx.dataplane.rudderstack.com",
    bool isLocal = true,
    String env = "DEV"}) async {
  serviceLocator?.registerLazySingleton(() => SentryUtil());

  _sharedPref = await SharedPreferences.getInstance();
  SimpleConnectionChecker checker = SimpleConnectionChecker();
  serviceLocator?.registerLazySingleton(() => NetworkUtil(checker));
  serviceLocator?.allowReassignment = true;
  _setupImagePicker();
  serviceLocator?.registerLazySingleton(() => PrefUtils(_getSharedPref()));
  serviceLocator?.registerLazySingleton(() => ThemeBloc(ThemeState(
        themeType: getPrefUtils().getThemeData(),
      )));
  _setupUserDetailsServices();
  _setupScanServices();
  _setupLogService();
  _setupBloc();
  // rekognition
  myProjectARN = projectARN;
  _setupSDK(isLocal: isLocal);
  _setupRudderStack(rudderStackKey, rudderPlaneUrl: rudderPlaneUrl);
  _setupAnalytics(mixPanelToken);
}

_setupAnalytics(String token) async {
  try {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    serviceLocator?.registerLazySingleton(() => analytics);
    serviceLocator?.registerLazySingleton(
        () => FirebaseAnalyticsObserver(analytics: analytics));
    serviceLocator?.registerLazySingleton(() =>
        GoogleAnalyticsRemoteDatasource(analytics, getFBAnalyticsObserver()));
  } catch (e) {
    // print("Error setting up google analytics");
  }

  serviceLocator?.registerLazySingleton(() => AnalyticsRepository(
      _getSharedPref(),
      googleAnalyticsRemoteDS: getGoogleAnalyticsRemoteDS(),
      rudderStackRemoteDS: rudderAnalyticsRemoteDS()));
}

FirebaseAnalytics getFBAnalytics() {
  return serviceLocator!<FirebaseAnalytics>();
}

FirebaseAnalyticsObserver getFBAnalyticsObserver() {
  return serviceLocator!<FirebaseAnalyticsObserver>();
}

GoogleAnalyticsRemoteDatasource? getGoogleAnalyticsRemoteDS() {
  try {
    return serviceLocator!<GoogleAnalyticsRemoteDatasource>();
  } catch (e) {
    return null;
  }
}

AnalyticsRepository getAnalyticsRepo() {
  return serviceLocator!<AnalyticsRepository>();
}

ThemeBloc getThemeBloc() {
  return serviceLocator!<ThemeBloc>();
}

PrefUtils getPrefUtils() {
  return serviceLocator!<PrefUtils>();
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

_setupImagePicker() {
  serviceLocator?.registerLazySingleton(() => ImagePicker());
  serviceLocator?.registerLazySingleton(() => HelperUtil());
}

ImagePicker getImagePicker() {
  return serviceLocator!<ImagePicker>();
}

HelperUtil getHelperUtil() {
  return serviceLocator!<HelperUtil>();
}

SharedPreferences _getSharedPref() {
  return _sharedPref!;
}

Dio getDio() {
  return getNetworkUtil().getDio(isDebug: true);
}

String assetPicker(String path) {
  String? modelPath = "";
  _getApplicationPath(path).then((s) {
    modelPath = s;
  });
  return modelPath ?? "";
}

Future<String> _getApplicationPath(String path) async {
  var result = await getApplicationSupportDirectory();
  return "${result.path}/$path";
}

_setupUserDetailsServices() {
  serviceLocator?.registerLazySingleton(
      () => UserDetailsLocalDatasource(_getSharedPref()));
  serviceLocator
      ?.registerLazySingleton(() => UserDetailsRemoteDatasource(getDio()));
  serviceLocator?.registerLazySingleton(() =>
      UserDetailsRepository(_getUserDetailsLocal(), _getUserDetailsRemote()));
}

IUserDetailsLocalDatasource _getUserDetailsLocal() {
  return serviceLocator!<UserDetailsLocalDatasource>();
}

IUserDetailsRemoteDatasource _getUserDetailsRemote() {
  return serviceLocator!<UserDetailsRemoteDatasource>();
}

IUserDetailsRepository getUserDetailsRepo() {
  return serviceLocator!<UserDetailsRepository>();
}

_setupScanServices() {
  serviceLocator?.registerLazySingleton(() => AuthRemoteDatasource(getDio()));
  serviceLocator
      ?.registerLazySingleton(() => AuthLocalDatasource(_getSharedPref()));
  serviceLocator?.registerLazySingleton(
      () => AuthRepository(_getAuthLocalDS(), _getAuthRemoteDS()));

  serviceLocator?.registerLazySingleton(
      () => ScanRemoteDatasource(getDio(), getHelperUtil(), getSentryUtil()));
  serviceLocator
      ?.registerLazySingleton(() => ScanLocalDatasource(_getSharedPref()));
  serviceLocator?.registerLazySingleton(() => ScanRepository(
      getLogLocalDS(),
      _getScanLocalDS(),
      _getScanRemoteDS(),
      getHelperUtil(),
      _getAuthLocalDS()));
}

AuthRemoteDatasource _getAuthRemoteDS() {
  return serviceLocator!<AuthRemoteDatasource>();
}

AuthLocalDatasource _getAuthLocalDS() {
  return serviceLocator!<AuthLocalDatasource>();
}

AuthRepository getAuthRepo() {
  return serviceLocator!<AuthRepository>();
}

IScanRemoteDatasource _getScanRemoteDS() {
  return serviceLocator!<ScanRemoteDatasource>();
}

IScanLocalDatasource _getScanLocalDS() {
  return serviceLocator!<ScanLocalDatasource>();
}

ScanRepository scanRepository() {
  return serviceLocator!<ScanRepository>();
}

_setupLogService() {
  serviceLocator
      ?.registerLazySingleton(() => LogLocalDatasource(_getSharedPref()));
}

ILogLocalDatasource getLogLocalDS() {
  return serviceLocator!<LogLocalDatasource>();
}

_setupSDK({bool isLocal = true}) {
  serviceLocator?.registerLazySingleton(() => HelixworldsSDKService(
      getUserDetailsRepo(),
      scanRepository(),
      getLogLocalDS(),
      getImagePicker(),
      getHelperUtil(),
      _getAuthLocalDS(),
      isLocal: isLocal));
}

IHelixworldsSDKService getSDK() {
  return serviceLocator!<HelixworldsSDKService>();
}

// analytics service
_setupRudderStack(String rudderStackKey,
    {String rudderPlaneUrl =
        "https://rudderstacgwyx.dataplane.rudderstack.com"}) {
  final RudderController rudderClient = RudderController.instance;
  RudderConfigBuilder builder = RudderConfigBuilder();
  builder.withDataPlaneUrl(rudderPlaneUrl);
  rudderClient.initialize(rudderStackKey, config: builder.build());
  serviceLocator?.registerLazySingleton(() => rudderClient);
  serviceLocator?.registerLazySingleton(
      () => AnalyticsRudderStackRemoteDatasource(rudderClient));
}

AnalyticsRudderStackRemoteDatasource rudderAnalyticsRemoteDS() {
  return serviceLocator!<AnalyticsRudderStackRemoteDatasource>();
}

SentryUtil getSentryUtil() {
  return serviceLocator!<SentryUtil>();
}

/// bloc DI
_setupBloc() {}
