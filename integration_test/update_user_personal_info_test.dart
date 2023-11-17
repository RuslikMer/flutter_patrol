import 'package:bambinifashion/main.dart' as app;
import 'package:flutter_tests_companion/helper.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests_companion/pages.dart';
import 'package:patrol/patrol.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  patrolTest(
      'update user personal information',
      config: const PatrolTesterConfig(settlePolicy: SettlePolicy.trySettle, existsTimeout: Duration(seconds: 2), visibleTimeout: Duration(seconds: 2), settleTimeout: Duration(seconds: 2)),
      nativeAutomation: true,
      nativeAutomatorConfig: const NativeAutomatorConfig(
          findTimeout: Duration(seconds: 2),
          packageName: 'com.bambinifashion.staging'
      ), ($) async {
    final base = Base(tester: $.tester);

    app.main();

    await base.menu.logIn($, GlobEnv.changeEmail, GlobEnv.password);
    await $.native.tapOnNotificationBySelector(
      Selector(textContains: 'Don\'t allow'),
    );
    await base.profile.goToTabFromProfile($, 'PERSONAL INFORMATION');
    await base.profile.updateData($, GlobEnv.newName, GlobEnv.newLastName, GlobEnv.newEmail, GlobEnv.newPassword);
    await base.profile.logOut($);
    await base.login.doLogin($, GlobEnv.newEmail, GlobEnv.newPassword);
    await base.profile.goToTabFromProfile($, 'PERSONAL INFORMATION');
    await base.profile.updateData($, GlobEnv.buyerName, GlobEnv.buyerLastName, GlobEnv.changeEmail, GlobEnv.password);
    // Remove this to stop the app
    // await tester.pumpAndSettle();
  });
}
