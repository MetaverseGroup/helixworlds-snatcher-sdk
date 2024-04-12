import 'dart:io';

Future<String> loadJsonString(String filePath) async {
  final String response = File(filePath).readAsStringSync();
  return response;
}


dynamic scanSuccessResponse = loadJsonString('test/features/scan/data/testdata,json');

dynamic scanFailureResponse = {
  'message': ''
};