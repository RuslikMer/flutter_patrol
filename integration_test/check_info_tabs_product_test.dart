import 'package:bambinifashion/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests_companion/pages.dart';
import 'package:patrol/patrol.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  patrolTest(
      'check information tabs',
      config: const PatrolTesterConfig(settlePolicy: SettlePolicy.trySettle, existsTimeout: Duration(seconds: 2), visibleTimeout: Duration(seconds: 2), settleTimeout: Duration(seconds: 2)),
      nativeAutomation: true,
      nativeAutomatorConfig: const NativeAutomatorConfig(
          findTimeout: Duration(seconds: 2),
          packageName: 'com.bambinifashion.staging'
      ), ($) async {
    final base = Base(tester: $.tester);

    app.main();

    await base.menu.goToMenuCategory($, base.menu.newIn);
    await $.native.tapOnNotificationBySelector(
      Selector(textContains: 'Don\'t allow'),
    );
    await base.catalog.goToProduct($);
    await base.product.openTab($, 'DESCRIPTION', true);
    await base.product.openTab($, 'DELIVERY AND RETURNS', false);
    // Remove this to stop the app
    //await tester.pumpAndSettle();
  });
}
