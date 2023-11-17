app-icons:
	dart run flutter_launcher_icons

splash:
	dart run flutter_native_splash:create

routes-watch:
	dart run build_runner watch

routes-build:
	dart run build_runner build --delete-conflicting-outputs

build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs

clean:
	flutter clean && flutter pub get && make routes-build

firebase-staging:
	flutterfire config \
	  --project=bambini-staging \
	  --out=lib/firebase_config/staging.dart \
	  --android-package-name=com.bambinifashion.staging \
	  --ios-bundle-id=com.bambinifashion.staging \
	  --platforms=android,ios

firebase-production:
	flutterfire config \
	  --project=bambini-prod \
	  --out=lib/firebase_config/production.dart \
	  --android-package-name=com.bambinifashion.production \
	  --ios-bundle-id=com.bambinifashion.production \
	  --platforms=android,ios