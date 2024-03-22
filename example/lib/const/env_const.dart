import 'package:flutter_dotenv/flutter_dotenv.dart';

String? rudderDataPlaneUrl = dotenv.get('RUDDERDATAPLANEURL', fallback: 'no data plane url set');
String? rudderKey = dotenv.get('RUDDERKEY', fallback: 'no rudder key set');
String? mixPanelToken = dotenv.get('MIXPANELTOKEN', fallback: 'no rudder key set');
String? region = dotenv.get('REGION', fallback: 'no rudder key set');