import 'package:equatable/equatable.dart';

class Success extends Equatable{
  @override
  List<Object> get props => [];
}

class ValidationSuccess extends Success{}
class LocationPermissionGrantedSuccess extends Success{}

class CacheSuccess extends Success {}

class SetupDISuccess extends Success {}
class WebRouteSuccess extends Success {}

class RedirectWebSuccess extends Success {}
