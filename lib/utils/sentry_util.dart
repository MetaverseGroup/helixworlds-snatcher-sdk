import 'package:sentry_flutter/sentry_flutter.dart';

class SentryUtil {
  void captureException(Object exception) async {
    await Sentry.captureException(exception);
  }
}
