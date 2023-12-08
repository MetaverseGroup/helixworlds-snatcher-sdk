
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';


class NetworkUtil {
  final SimpleConnectionChecker dataConn;
  NetworkUtil(this.dataConn);
  
  Stream<bool> get isConnected => dataConn.onConnectionChange;
  /// if you want to return debug mode of dio which will include prettyfy display of the request sent via http or receive else it will not print the request use strictly on debugging mode
  /// 
  /// 
  Dio getDio({bool isDebug = false, int maxWidth = 128, bool requestBody = true, bool requestHeader = true, bool request = true, bool error = true, bool responseBody = true, String cert = ""}) {
    Dio dio = Dio();

    if (isDebug) {
      dio.interceptors.add(
        PrettyDioLogger(
            requestBody: requestBody,
            requestHeader: requestHeader,
            request: request,
            maxWidth: maxWidth,
            error: error,
            responseBody: responseBody),
      );
      return dio;
    }
    return Dio();
  }
}