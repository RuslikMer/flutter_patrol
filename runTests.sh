#!/bin/bash

find integration_test -name '*test.dart' | while read test
do
  echo "~~~~packing test suite for $test~~~~"
  flutter build apk --debug --flavor=staging -t "./$test"
  echo "~~~~start testing~~~~"
  dart run run_tests.dart || true
  sleep 120
done