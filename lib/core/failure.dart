import 'package:app_common_modules/core/failure.dart';

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
  WebRouteFailure(String message):super(message: message);

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
