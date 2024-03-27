import 'package:flutter_dotenv/flutter_dotenv.dart';

String? rudderDataPlaneUrl = dotenv.get('RUDDERDATAPLANEURL', fallback: 'no data plane url set');
String? rudderKey = dotenv.get('RUDDERKEY', fallback: 'no rudder key set');
String? mixPanelToken = dotenv.get('MIXPANELTOKEN', fallback: 'no rudder key set');
String? region = dotenv.get('REGION', fallback: 'no rudder key set');
String? developerKey = dotenv.get('H_DEVELOPER_ID', fallback: 'no developer key set');
String? secretKey = dotenv.get('H_SECRET_KEY', fallback: 'no secret key set');