import 'package:app_common_modules/core/failure.dart';

class GetUserIDFailure extends Failure {
  @override
  String getErrorMessage() {
    // TODO: implement getErrorMessage
    return "Having issue fetching user ID";
  }
}

class RepositoryFailure extends Failure {}

class ItemNotDetectedFailure extends Failure {
  @override
  String getErrorMessage() {
    // TODO: implement getErrorMessage
    return "Item not detected";
  }
}

class CacheFailure extends Failure {}