// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:image_picker/image_picker.dart';

import '../user_details/user_details_repository.dart';

abstract class ScanScreenState extends Equatable  {}
abstract class ScanScreenEvent extends Equatable {}


class ScanScreenTakePictureEvent extends ScanScreenEvent {
  @override
  List<Object?> get props => [];
}

class ScanScreenRedirectToUrlEvent extends ScanScreenEvent {
  final String url;
  ScanScreenRedirectToUrlEvent(this.url);
  @override
  List<Object?> get props => []; 

}

class ScanScreenLaunchToUrlEvent extends ScanScreenEvent {
  final InventoryItemModel model;
  ScanScreenLaunchToUrlEvent(this.model);
  @override
  List<Object?> get props => []; 
}

class ScanScreenViewLogsEvent extends ScanScreenEvent {
  @override
  List<Object?> get props => [];
}

class ScanScreenViewGuideEvent extends ScanScreenEvent {
  @override
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
  final InventoryItemModel? object;
  final String userId;
  ScanScreenShowScannedObjectState(this.object, this.userId);
  @override
  List<Object> get props => [object!, userId];
}


class ScanScreenViewLogsState extends ScanScreenState {
  final List<MyLogModel> logs;
  ScanScreenViewLogsState(this.logs);

  @override
  List<Object?> get props => [logs];
}

class ScanScreenSuccessRedirectState extends ScanScreenState {
  final String redirectUrl;
  ScanScreenSuccessRedirectState(this.redirectUrl);
  @override
  List<Object?> get props => [redirectUrl];
}

class ScanScreenShowGuideState extends ScanScreenState {
  @override
  List<Object?> get props => [];
}

class ScanScreenPageBloc extends Bloc<ScanScreenEvent,ScanScreenState>{

  final IUserDetailsRepository _userDetailsRepository;
  final ILogLocalDatasource _localDS;
  final IScanRepository _scanRepo;
  final ImagePicker picker;
  final HelperUtil _helperUtil;
  final bool isLocalItemDetailsFetch;

  ScanScreenPageBloc(this._userDetailsRepository, this._localDS, this._scanRepo, this.picker, this._helperUtil, {this.isLocalItemDetailsFetch = true}):super(ScanScreenInitialState()){
    fetchUserID();
    on<ScanScreenRedirectToUrlEvent>((event, emit){
      _redirectUrlObjectFromLogs(event.url);
    });
    on<ScanScreenLaunchToUrlEvent>((event, emit){
      _redirectUrlObject(event.model);
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
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenFailure(l.getErrorMessage()));
    }, (r) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenViewLogsState(r.reversed.toList()));
    });
  }

  _redirectUrl(String murl) async{
    var userId = getUserID();
    final userParam =
        userId.isNotEmpty ? '?userId=$userId' : '';
    final Uri url =
        Uri.parse(murl + userParam);
    var result = await _helperUtil.redirectUrl(url);
    result.fold((l) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenFailure(l.getErrorMessage()));
    }, (r) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenSuccessRedirectState(url.toString()));
    });
  }

  _redirectUrlObjectFromLogs(String url){
    _redirectUrl(url);
    Future.delayed(const Duration(seconds: 1), (){
      _fetchLogs();
      // emit(ScanScreenShowScannedObjectState(model, userId));
    });    
  }

  _redirectUrlObject(InventoryItemModel model) async {
    await _redirectUrl(model.url ?? "");
    Future.delayed(const Duration(seconds: 1), (){
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenShowScannedObjectState(model, userId));
    });
  }

  String userId = "";
  fetchUserID() async {
    var result = await _userDetailsRepository.getUserID();
    result.fold((l) => null, (r) {
      userId = r;
    });
    
  }

  String getUserID(){
    if(userId.isNotEmpty){
      return userId;
    } else {
      return "";
    }
  }

  _toLoadingState(){
    if(state is! ScanScreenLoadingState){
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenLoadingState());
    }
  }


  _pickImage() async {
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);

                        if (photo != null) {
                          final inputImage = _helperUtil.getInputImageFile(photo);
                          if(isLocalItemDetailsFetch){
                            // local based item details
                            var result = await _scanRepo.processImageLocal(inputImage);
                            result.fold((l) {
                              // ignore: invalid_use_of_visible_for_testing_member
                              emit(ScanScreenFailure(l.getErrorMessage()));
                            }, (r) {
                              // ignore: invalid_use_of_visible_for_testing_member
                              emit(ScanScreenShowScannedObjectState(r, getUserID()));
                            });
                          } else {
                            // api based item details
                            var result = await _scanRepo.processImage(inputImage);                            
                            result.fold((l) {
                              // ignore: invalid_use_of_visible_for_testing_member
                              emit(ScanScreenFailure(l.getErrorMessage()));
                            }, (r) {
                              // ignore: invalid_use_of_visible_for_testing_member
                              emit(ScanScreenShowScannedObjectState(r, getUserID()));
                            });
                          }
                        }
  }
}
