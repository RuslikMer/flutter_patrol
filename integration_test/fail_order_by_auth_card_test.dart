import 'package:bambinifashion/main.dart' as app;
import 'package:flutter_tests_companion/helper.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests_companion/pages.dart';
import 'package:patrol/patrol.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  patrolTest(
      'fail order by authorized card',
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
    await base.product.addToCart($);
    await base.cart.goToCheckout($);
    await base.login.guestLogin($);
    await base.checkout.fillContacts($, GlobEnv.buyerCountry, GlobEnv.buyerAddress, GlobEnv.buyerCity,  GlobEnv.buyerPostcode);
    await base.checkout.chooseShippingMethod($, 'express');
    await base.checkout.fillCardData($, GlobEnv.buyerStripesAuth);
    await base.checkout.complete3DSecure($, false);
    await base.checkout.waitAlert($, 'We are unable to authenticate your payment method. Please choose a different payment method and try again.', true);

    // Remove this to stop the app
    //await tester.pumpAndSettle();
  });
}
