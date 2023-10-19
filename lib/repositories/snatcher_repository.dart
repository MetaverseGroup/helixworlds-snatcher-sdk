import 'package:app_common_modules/di/services_di.dart';
import 'package:dio/dio.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/models/log_model.dart';
import 'package:helixworlds_snatcher_sdk/models/object_detected_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/failure.dart';
import 'package:helixworlds_snatcher_sdk/utils/image_detector.dart';

abstract class SnatcherRepository {
  Future<ObjectDetectedModel?> fetchObjectDetected(InputImage inputImage);

  Future<List<LogModel>> fetchLogs();

  Future<void> addLog(LogModel log);

  Future<String> getUserId();
}

class SnatcherRepositoryImpl extends SnatcherRepository {
  late ImageDetector _detector;
  late SharedPreferences _sharedPreferences;
  late Dio _dio;

  SnatcherRepositoryImpl() {
    _initialize();
  }

  Future<void> _initialize() async {
    _detector = ImageDetector();
    _sharedPreferences = await SharedPreferences.getInstance();
    // _dio = Dio(BaseOptions(headers: {'Access-Control-Allow-Origin': '*'}));
    _dio = getNetworkUtil().getDio(isDebug: true);
  }

  @override
  Future<ObjectDetectedModel?> fetchObjectDetected(InputImage inputImage) {
    try {
      return _detector.processImage(inputImage);
    } catch (e) {
      throw Failure();
    }
  }

  @override
  Future<List<LogModel>> fetchLogs() async {
    final prefs = await SharedPreferences.getInstance();

    var logsString = prefs.getString('logs');

    final logs = <LogModel>[];

    if (logsString != null) {
      final storedLogs = LogModel.decode(logsString);
      logs.addAll(storedLogs);
    }

    return logs;
  }

  @override
  Future<void> addLog(LogModel log) async {
    var logsString = _sharedPreferences.getString('logs');

    final logs = <LogModel>[];

    if (logsString != null) {
      final storedLogs = LogModel.decode(logsString);
      logs.addAll(storedLogs);
    } else {
      logsString = '';
    }

    logs.insert(0, log);

    // Encode and store data in SharedPreferences
    final String encodedData = LogModel.encode(logs);

    await _sharedPreferences.setString('logs', encodedData);
  }

  @override
  Future<String> getUserId() async {
    // final response =
    //     await _dio.get('https://helixworlds.gatherer.ngrok.dev/user/find');

    try {
      final response =
          await _dio.get(
            'https://gatherer.d.helixworlds.io/user/find',
            options: Options(
                headers: {'Access-Control-Allow-Origin': '*'},
                contentType: "application/json"
            )
          );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        print("Fetching the user ID");
        print(data.toString());
        final userId = data['extId'] as String;
        print(userId);

        return userId;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
