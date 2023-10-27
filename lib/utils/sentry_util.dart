// ignore_for_file: depend_on_referenced_packages

import 'package:sentry/sentry.dart';

class SentryUtil {

  /// performance analysis
  void checkFunction(Function function, {String name = "testFunction", String task = "default name task"}) async {
    final transaction = Sentry.startTransaction(name, task);
    try {
      function();
    } catch (exception) {
      transaction.throwable = exception;
      transaction.status = const SpanStatus.internalError();
    } finally {
      await transaction.finish();
    }
  }
}