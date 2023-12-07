
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
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
    if(cert.isNotEmpty) {
      attachCert(dio, cert);
    }

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
  
  attachCert(Dio dio, String cert) async {
    var certificate = await rootBundle.load(cert);
    var certBytes = certificate.buffer.asUint8List();
    var certString = String.fromCharCodes(certBytes);
    var certLines = certString.split("\n");
    dio.interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: certLines));
  }


  Dio getClient(String baseUrl, List<String> allowedSHAFingerprints){
      var dio =  Dio(BaseOptions(baseUrl: baseUrl))
        ..interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: allowedSHAFingerprints));
      return dio;
  }
}