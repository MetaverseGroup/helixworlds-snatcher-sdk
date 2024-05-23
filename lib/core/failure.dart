
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final String code;
  const Failure({this.message = "Unable to process service at this time", this.code = ""});
  @override
  List<Object> get props => [message, code];

  String getErrorMessage(){
    return message;
  }
}


class EmailValidationFailure extends Failure {}
class InvalidInputFailure extends Failure {}
class ParseAmountFailure extends Failure {}

class LocationPermissionDeniedFailure extends Failure {}
class GeoLocationUtilFailure extends Failure {}
class LocationServiceFailure extends Failure {}
class LocationPermissionDeniedForeverFailure extends Failure {}
class RegistrationFailure extends Failure {
  
  @override
  String getErrorMessage(){
    return "Please fill the required fields to proceed Registration";
  }
}

class LocalDatasourceFailure extends Failure {
  @override
  String getErrorMessage(){
    return "Please allow storage access on this app or consult with us about the issue";
  }
}

class GetUserIDFailure extends Failure {
  @override
  String getErrorMessage() {
    return "Having issue fetching user ID";
  }
}

class RepositoryFailure extends Failure {}

class ItemNotDetectedFailure extends Failure {
  @override
  String getErrorMessage() {
    return "Item not detected";
  }
}

class CacheFailure extends Failure {}

class SetupServiceFailure extends Failure {}

class GetItemByIDRemoteFailure extends Failure {
  @override
  String getErrorMessage() {
    return "Having issue fetching item";
  }
}

class NoDataFoundFailure extends Failure {}

class WebRouteFailure extends Failure {
  const WebRouteFailure(String message):super(message: message);

  @override
  String getErrorMessage() {
    return "Url not found";
  }
}

class HelperGetRequestFailure extends Failure {
  @override
  String getErrorMessage() {
    return "Helper error";
  }
}

class RedirectWebUrlFailure extends Failure {}

class AnalyticsLogsFailure extends Failure {}

class ServiceNotSetupFailure extends Failure {
  const ServiceNotSetupFailure(String message):super(message: message);
}

class HSSDKFailure extends Failure {}

class AuthenticationFailure extends Failure {}

class ServiceFailure extends Failure {}

class DataDeletionFailure extends Failure {}

