import 'dart:io';
import 'run_tests.dart';

Future<String> main() async {
  final testSuiteUrl = await sendPost(
      'https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/test-suite',
      'build/app/outputs/apk/androidTest/staging/debug/app-staging-debug-androidTest.apk',
      'test_suite_url'
  );

  await _write(testSuiteUrl);

  return testSuiteUrl;
}

_write(String text) async {
  final File file = File('./testSuiteUrl.txt');
  await file.writeAsString(text);
}
