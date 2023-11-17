# bambinifashion

Integration tests

## Getting Started

We are using Patrol framework, how to install locally https://patrol.leancode.co/getting-started
Native integration already in project, no need to set up it again.

Before start check that u already set up flapster project, information should be in root Readme file.

1. You will need 2 files google-services.json, 1 for stage and 1 for prod, u can ask it from project maintainer.
    Depends on what version, stage or prod, u want to build, u should put this version of json into flapster/android/app directory.
2. Also u need 2 .env files, same stage and prod, ask it from project maintainer, than put it into root flapster directory.

## Running tests

1. For run test file from root use:
   patrol test --target integration_test/patrol_test.dart --dart-define=integration_test=true --verbose

    --target for selecting test path to run "integration_test/patrol_test.dart"
    --dart-define=integration_test=true for choosing integration_test build
    --verbose for more logs
