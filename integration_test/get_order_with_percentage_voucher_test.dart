import 'dart:developer';
import 'package:bambinifashion/main.dart' as app;
import 'package:flutter_tests_companion/helper.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests_companion/pages.dart';
import 'package:patrol/patrol.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  patrolTest(
      'get order with percentage voucher',
      config: const PatrolTesterConfig(settlePolicy: SettlePolicy.trySettle, existsTimeout: Duration(seconds: 2), visibleTimeout: Duration(seconds: 2), settleTimeout: Duration(seconds: 2)),
      nativeAutomation: true,
      nativeAutomatorConfig: const NativeAutomatorConfig(
          findTimeout: Duration(seconds: 2),
          packageName: 'com.bambinifashion.staging'
      ), ($) async {
    final base = Base(tester: $.tester);
    final qaApi = QaApi();
    app.main();

    await base.menu.goToMenuCategory($, base.menu.newIn);
    await $.native.tapOnNotificationBySelector(
      Selector(textContains: 'Don\'t allow'),
    );
    await base.catalog.goToProduct($);
    await base.product.addToCart($);
    String voucher = await qaApi.generatePercentageVoucher('25', 1);
    log(voucher);
    await base.cart.useVoucher($, voucher);
    await base.cart.goToCheckout($);
    await base.login.guestLogin($);
    await base.checkout.fillContacts($, GlobEnv.buyerCountry, GlobEnv.buyerAddress, GlobEnv.buyerCity,  GlobEnv.buyerPostcode);
    int totalPrice = await base.checkout.chooseShippingMethod($, 'standard');
    await base.checkout.fillCardData($, GlobEnv.buyerStripesNonAuth);
    await base.checkout.confirmOrder($);
    await base.checkout.viewOrder($, totalPrice);

    // Remove this to stop the app
    //await tester.pumpAndSettle();
  });
}
