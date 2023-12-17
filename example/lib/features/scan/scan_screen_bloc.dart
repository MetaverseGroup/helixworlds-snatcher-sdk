// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member, duplicate_ignore

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/helixworlds_sdk.dart';


abstract class ScanScreenState extends Equatable  {}
abstract class ScanScreenEvent extends Equatable {}

class ScanScreenGetStartedEvent extends ScanScreenEvent {
  @override
  List<Object> get props => [];
}

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


class ScanScreenGettingStartedState extends ScanScreenState { 
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
  final IHelixworldsSDKService _helixworldSDK;

  ScanScreenPageBloc(this._helixworldSDK):super(ScanScreenGettingStartedState()){
    fetchUserID();

    on<ScanScreenGetStartedEvent>((event, emit){
      emit(ScanScreenInitialState());
    });
    on<ScanScreenRedirectToUrlEvent>((event, emit){
      _redirectUrlObjectFromLogs(event.url);
    });
    on<ScanScreenLaunchToUrlEvent>((event, emit){
      _redirectUrlObject(event.model);
    });
    on<ScanScreenTakePictureEvent>((event, emit) async{
      var result = await _helixworldSDK.scanItem();
      if(result.isRight()){
        var rightResult = result.fold((l) => null, (r) => r);
        if(rightResult is ObjectDetectedSuccess){
          emit(ScanScreenShowScannedObjectState(rightResult.item, rightResult.userId));
        }
      } else {
          var leftValue = result.fold((l) => l, (r) => null);
          emit(ScanScreenFailure(leftValue?.getErrorMessage() ?? ""));
      }
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

    var result = await _helixworldSDK.fetchScannedItems();
    result.fold((l) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenFailure(l.getErrorMessage()));
    }, (r) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenViewLogsState(r.reversed.toList()));
    });
  }

  _redirectUrl(String murl) async{
    var result = await _helixworldSDK.redirectToUrl(murl);
    result.fold((l) {
      emit(ScanScreenFailure(l.getErrorMessage()));
    }, (r) {
      emit(ScanScreenSuccessRedirectState(""));
    });

  }

  _redirectUrlObjectFromLogs(String url){
    _redirectUrl(url);
    Future.delayed(const Duration(seconds: 1), (){
      _fetchLogs();
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
    var result = await _helixworldSDK.getUserId();
    result.fold((l) => null, (r) {
      userId = r;
    });    
  }

  String getUserID(){
    var result = _helixworldSDK.getDefaultUserId();
    return result;
  }

  _toLoadingState(){
    if(state is! ScanScreenLoadingState){
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ScanScreenLoadingState());
    }
  }

  bool isLocalItemDetailsFetch(){
    return _helixworldSDK.isLocalFetch();
  }
}
