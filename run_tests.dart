import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';

void main() async {

  final dio = Dio();

  final deviceName = 'device_name';
  final suiteUrl = await _read();
  final appUrl = await uploadApp();
  final auth = 'Basic ${base64Encode(utf8.encode('name:pass'))}';

  final data = {
      'app': appUrl,
      'testSuite': suiteUrl,
      'devices': [deviceName],
      'deviceLogs': 'true',
      'networkLogs': 'true',
      'project': 'Flapster'
  };

  print(data);

  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = auth;
  final response = await dio.post(
    'https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/build',
    data: data,
  );

  final status = response.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  print(response.data);
}

Future<String> uploadApp() async {
  return await sendPost(
      'https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/app',
      'build/app/outputs/apk/staging/debug/app-staging-debug.apk',
      'app_url'
  );
}

// Future getFiles() async {
//   final dir = Directory('./integration_test');
//   final List<FileSystemEntity> entities = await dir.list().toList();
//   for (int i = 0; i < entities.length; i++){
//     String filename = basename(entities.elementAt(i).path);
//     print(filename);
//   }
// }

Future<String> sendPost(String uri, String file, String dataName) async {
  final dio = Dio();
  final auth = 'Basic ${base64Encode(utf8.encode('name:pass'))}';

  String fileName = file.split('/').last;
  FormData formData = FormData.fromMap({
    "file":
    await MultipartFile.fromFile(file, filename:fileName),
  });

  dio.options.headers['Authorization'] = auth;
  final response = await dio.post(
    uri,
    data: formData,
  );

  final status = response.statusCode;
  if (status != 200) throw Exception('http.send error: statusCode = $status');
  final data = response.data[dataName];
  print(data);

  return data;
}

Future<String> _read() async {
  String text = '';
  try {
    final File file = File('./testSuiteUrl.txt');
    text = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }

  return text;
}