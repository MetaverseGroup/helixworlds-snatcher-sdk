import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
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
  @override
  // TODO: implement props
  List<Object?> get props => []; 
}

class ScanScreenViewLogsEvent extends ScanScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ScanScreenInitialState extends ScanScreenState {
  @override
  List<Object> get props => [];
}

class ScanScreenBackEvent extends ScanScreenEvent {
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

class ScanScreenShowLogsState extends ScanScreenState { 
  final List<LogModel> logs;
  ScanScreenShowLogsState(this.logs);
  @override
  // TODO: implement props
  List<Object?> get props => [logs];
}

class ScanScreenPageBloc extends Bloc<ScanScreenEvent,ScanScreenState>{

  final ImageDetector _detector;
  final IUserDetailsRepository _userDetailsRepository;
  final ILogLocalDatasource _localDS;
  ScanScreenPageBloc(this._detector, this._userDetailsRepository, this._localDS):super(ScanScreenInitialState()){
    on<ScanScreenLaunchToUrlEvent>((event, emit){
      _launchUrl();
    });
    on<ScanScreenTakePictureEvent>((event, emit){
      _pickImage();
    });
    on<ScanScreenViewLogsEvent>((event, emit) {
      
    });
    on<ScanScreenBackEvent>((event, emit){
      emit(ScanScreenInitialState());
    });
  }

  _launchUrl() async {
    final userParam =
        userId.isNotEmpty ? '?userId=$userId' : '';
    final Uri url =
        Uri.parse(objectModel!.marketUrl + userParam);

        print(url.toString());
    if (!await launchUrl(url)) {
      throw Exception(
          'Could not launch ${objectModel!.marketUrl}$userParam');
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
                          _getObjectDetected(inputImage);
                          await fetchUserID();
                          emit(ScanScreenShowScannedObjectState(objectModel, userId));
                        }
  }

  String _getDateString() {
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  }
  ObjectDetectedModel? objectModel;
  Future<void> _getObjectDetected(InputImage inputImage) async {
    _toLoadingState();
    try {
      var object = await _detector.processImage(inputImage);
      if (object != null) {
          final model = MyLogModel(
              id: object.id,
              name: object.name,
              image: object.image,
              date: _getDateString(),
              game: 'Escape the bear'
          );
          await _addLog(model);
          objectModel = object;
      }
    } catch (e) {
      emit(ScanScreenFailure("Cannot detect object"));
    }
  }
  List<MyLogModel> logs = [];
  
  _addLog(MyLogModel log) async {
    logs.add(log);
    await _localDS.cacheLogs(logs);
  }
}
