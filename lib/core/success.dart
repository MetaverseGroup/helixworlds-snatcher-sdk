import 'package:equatable/equatable.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';

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

class ObjectDetectedSuccess extends Success {
  final InventoryItemModel item;
  final String userId;
  ObjectDetectedSuccess(this.item, this.userId);
}

class AnalyticsLogsSuccess extends Success {}
