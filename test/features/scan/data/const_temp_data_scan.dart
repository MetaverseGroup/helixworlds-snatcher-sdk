import 'dart:io';

Future<String> loadJsonString(String filePath) async {
  final String response = File(filePath).readAsStringSync();
  return response;
}

Future<String> scanSuccessResponse =
    loadJsonString('test/features/scan/data/testdata.json');
Future<String> scanSuccessUGCResponse =
    loadJsonString('test/features/scan/data/testjsondataugc.json');

dynamic scanFailureResponse = {'message': ''};
