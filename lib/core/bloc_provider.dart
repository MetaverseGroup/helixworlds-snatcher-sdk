// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';

/// this method must be called first before injecting this service to the bloc providers setupServices()
/// please see example folder for more detailed information about the implementation
final helixworldsFeaturesBloc = [
    // this only supports the local details fetch
    BlocProvider<ScanScreenPageBloc>(
          create: (BuildContext context) => ScanScreenPageBloc(getUserDetailsRepo(), getLogLocalDS(), scanRepository(), getImagePicker(), getHelperUtil(), isLocalItemDetailsFetch: true),
    ),
];


