import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/models/log_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/object_detected_model.dart';
import 'dart:io' as io;

import '../user_details/user_details_repository.dart';

abstract class ScanScreenState extends Equatable  {}
abstract class ScanScreenEvent extends Equatable {}


class ScanScreenTakePictureEvent extends ScanScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScanScreenLaunchToUrlEvent extends ScanScreenEvent {
  final ObjectDetectedModel model;
  ScanScreenLaunchToUrlEvent(this.model);
  @override
  // TODO: implement props
  List<Object?> get props => []; 
}

class ScanScreenViewLogsEvent extends ScanScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScanScreenViewGuideEvent extends ScanScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ScanScreenInitialState extends ScanScreenState {
  @override
  List<Object> get props => [];
}

class ScanScreenBackEvent extends ScanScreenEvent {
  final String subRoute;
  ScanScreenBackEvent(this.subRoute);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScanScreenLoadingState extends ScanScreenState { 
  @override
  List<Object> get props => [];
}

class ScanScreenFailure extends ScanScreenState { 
  final String message;
  ScanScreenFailure(this.message);
  @override
  List<Object> get props => [message];
}



class ScanScreenShowScannedObjectState extends ScanScreenState {
  final ObjectDetectedModel? object;
  final String userId;
  ScanScreenShowScannedObjectState(this.object, this.userId);
  @override
  List<Object> get props => [object!, userId];
}


class ScanScreenViewLogsState extends ScanScreenState {
  final List<MyLogModel> logs;
  ScanScreenViewLogsState(this.logs);

  @override
  // TODO: implement props
  List<Object?> get props => [logs];
}

class ScanScreenShowGuideState extends ScanScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScanScreenPageBloc extends Bloc<ScanScreenEvent,ScanScreenState>{

  final IUserDetailsRepository _userDetailsRepository;
  final ILogLocalDatasource _localDS;
  final IScanRepository _scanRepo;

  ScanScreenPageBloc(this._userDetailsRepository, this._localDS, this._scanRepo):super(ScanScreenInitialState()){
    on<ScanScreenLaunchToUrlEvent>((event, emit){
      _launchUrl(event.model);
    });
    on<ScanScreenTakePictureEvent>((event, emit){
      _pickImage();
    });
    on<ScanScreenViewLogsEvent>((event, emit) {
      _fetchLogs();
    });
    on<ScanScreenBackEvent>((event, emit){
      if(event.subRoute == "/"){
        emit(ScanScreenInitialState());
      }
    });

    on<ScanScreenViewGuideEvent>((event, emit){
      emit(ScanScreenShowGuideState());
    });
  }

  _fetchLogs() async {
    _toLoadingState();
    var result = await _localDS.getLogs();
    result.fold((l) {
      emit(ScanScreenFailure(l.getErrorMessage()));
    }, (r) {
      emit(ScanScreenViewLogsState(r));
    });
  }

  _launchUrl(ObjectDetectedModel object) async {
    final userParam =
        userId.isNotEmpty ? '?userId=$userId' : '';
    final Uri url =
        Uri.parse(object.marketUrl + userParam);

        print(url.toString());
    if (!await launchUrl(url)) {
      throw Exception(
          'Could not launch ${object.marketUrl}$userParam');
    } 
  }

  String userId = "";
  fetchUserID() async {
    var result = await _userDetailsRepository.getUserID();
    result.fold((l) => null, (r) {
      userId = r;
    });
  }

  _toLoadingState(){
    if(!(state is ScanScreenLoadingState)){
      emit(ScanScreenLoadingState());
    }
  }


  _pickImage() async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);

                        if (photo != null) {
                          final inputImage =
                              InputImage.fromFile(io.File(photo.path));
                          // _getObjectDetected(inputImage);
                          // fetch userId
                          await fetchUserID();
                          var result = await _scanRepo.processImage(inputImage);
                          result.fold((l) {
                            emit(ScanScreenFailure(l.getErrorMessage()));
                          }, (r) {
                            emit(ScanScreenShowScannedObjectState(r, userId));
                          });
                        }
  }
}
