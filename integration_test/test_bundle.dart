// GENERATED CODE - DO NOT MODIFY BY HAND AND DO NOT COMMIT TO VERSION CONTROL
// ignore_for_file: type=lint, invalid_use_of_internal_member

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol/src/native/contracts/contracts.pbgrpc.dart';
import 'package:test_api/src/backend/invoker.dart';

// START: GENERATED TEST IMPORTS
import 'add_and_remove_from_wishlist_page_test.dart' as add_and_remove_from_wishlist_page_test;
import 'add_to_wishlist_from_listing_auth_test.dart' as add_to_wishlist_from_listing_auth_test;
import 'add_to_wishlist_from_listing_test.dart' as add_to_wishlist_from_listing_test;
import 'add_to_wishlist_from_product_auth_test.dart' as add_to_wishlist_from_product_auth_test;
import 'add_to_wishlist_from_product_test.dart' as add_to_wishlist_from_product_test;
import 'brands_live_search_test.dart' as brands_live_search_test;
import 'categories_live_search_test.dart' as categories_live_search_test;
import 'check_cross_sale_scroll_product_test.dart' as check_cross_sale_scroll_product_test;
import 'check_info_tabs_product_test.dart' as check_info_tabs_product_test;
import 'check_pagination_catalog_test.dart' as check_pagination_catalog_test;
import 'check_size_guide_product_test.dart' as check_size_guide_product_test;
import 'fail_order_by_auth_card_test.dart' as fail_order_by_auth_card_test;
import 'filter_catalog_test.dart' as filter_catalog_test;
import 'forgot_password_test.dart' as forgot_password_test;
import 'get_order_by_apple_pay_test.dart' as get_order_by_apple_pay_test;
import 'get_order_by_auth_card_test.dart' as get_order_by_auth_card_test;
import 'get_order_by_empty_wallet_test.dart' as get_order_by_empty_wallet_test;
import 'get_order_by_non_auth_card_test.dart' as get_order_by_non_auth_card_test;
import 'get_order_by_paypal_test.dart' as get_order_by_paypal_test;
import 'get_order_with_fixed_amount_voucher_test.dart' as get_order_with_fixed_amount_voucher_test;
import 'get_order_with_percentage_voucher_test.dart' as get_order_with_percentage_voucher_test;
import 'go_to_all_products_live_search_test.dart' as go_to_all_products_live_search_test;
import 'login_before_add_and_remove_from_wishlist_by_listing_test.dart' as login_before_add_and_remove_from_wishlist_by_listing_test;
import 'patrol_test.dart' as patrol_test;
import 'products_live_search_test.dart' as products_live_search_test;
import 'quick_filter_catalog_test.dart' as quick_filter_catalog_test;
import 'recently_viewed_products_test.dart' as recently_viewed_products_test;
import 'request_size_product_test.dart' as request_size_product_test;
import 'sharing_product_test.dart' as sharing_product_test;
import 'swiping_images_product_test.dart' as swiping_images_product_test;
import 'swping_images_catalog_test.dart' as swping_images_catalog_test;
import 'update_user_personal_info_test.dart' as update_user_personal_info_test;
// END: GENERATED TEST IMPORTS

Future<void> main() async {
  // This is the entrypoint of the bundled Dart test.
  //
  // Its responsibilies are:
  //  * Running a special Dart test that runs before all the other tests and
  //    explores the hierarchy of groups and tests.
  //  * Hosting a PatrolAppService, which the native side of Patrol uses to get
  //    the Dart tests, and to request execution of a specific Dart test.
  //
  // When running on Android, the Android Test Orchestrator, before running the
  // tests, makes an initial run to gather the tests that it will later run. The
  // native side of Patrol (specifically: PatrolJUnitRunner class) is hooked
  // into the Android Test Orchestrator lifecycle and knows when that initial
  // run happens. When it does, PatrolJUnitRunner makes an RPC call to
  // PatrolAppService and asks it for Dart tests.
  //
  // When running on iOS, the native side of Patrol (specifically: the
  // PATROL_INTEGRATION_TEST_IOS_RUNNER macro) makes an initial run to gather
  // the tests that it will later run (same as the Android). During that initial
  // run, it makes an RPC call to PatrolAppSevice and asks it for Dart tests.
  //
  // Once the native runner has the list of Dart tests, it dynamically creates
  // native test cases from them. On Android, this is done using the
  // Parametrized JUnit runner. On iOS, new test case methods are swizzled into
  // the RunnerUITests class, taking advantage of the very dynamic nature of
  // Objective-C runtime.
  //
  // Execution of these dynamically created native test cases is then fully
  // managed by the underlying native test framework (JUnit on Android, XCTest
  // on iOS). The native test cases do only one thing - request execution of the
  // Dart test (out of which they had been created) and wait for it to complete.
  // The result of running the Dart test is the result of the native test case.

  final nativeAutomator = NativeAutomator(config: NativeAutomatorConfig());
  await nativeAutomator.initialize();
  final binding = PatrolBinding.ensureInitialized();
  final testExplorationCompleter = Completer<DartTestGroup>();

  // A special test to expore the hierarchy of groups and tests. This is a hack
  // around https://github.com/dart-lang/test/issues/1998.
  //
  // This test must be the first to run. If not, the native side likely won't
  // receive any tests, and everything will fall apart.
  test('patrol_test_explorer', () {
    final topLevelGroup = Invoker.current!.liveTest.groups.first;
    final dartTestGroup = createDartTestGroup(topLevelGroup);
    testExplorationCompleter.complete(dartTestGroup);
  });

  // START: GENERATED TEST GROUPS
  group('add_and_remove_from_wishlist_page_test', add_and_remove_from_wishlist_page_test.main);
  group('add_to_wishlist_from_listing_auth_test', add_to_wishlist_from_listing_auth_test.main);
  group('add_to_wishlist_from_listing_test', add_to_wishlist_from_listing_test.main);
  group('add_to_wishlist_from_product_auth_test', add_to_wishlist_from_product_auth_test.main);
  group('add_to_wishlist_from_product_test', add_to_wishlist_from_product_test.main);
  group('brands_live_search_test', brands_live_search_test.main);
  group('categories_live_search_test', categories_live_search_test.main);
  group('check_cross_sale_scroll_product_test', check_cross_sale_scroll_product_test.main);
  group('check_info_tabs_product_test', check_info_tabs_product_test.main);
  group('check_pagination_catalog_test', check_pagination_catalog_test.main);
  group('check_size_guide_product_test', check_size_guide_product_test.main);
  group('fail_order_by_auth_card_test', fail_order_by_auth_card_test.main);
  group('filter_catalog_test', filter_catalog_test.main);
  group('forgot_password_test', forgot_password_test.main);
  group('get_order_by_apple_pay_test', get_order_by_apple_pay_test.main);
  group('get_order_by_auth_card_test', get_order_by_auth_card_test.main);
  group('get_order_by_empty_wallet_test', get_order_by_empty_wallet_test.main);
  group('get_order_by_non_auth_card_test', get_order_by_non_auth_card_test.main);
  group('get_order_by_paypal_test', get_order_by_paypal_test.main);
  group('get_order_with_fixed_amount_voucher_test', get_order_with_fixed_amount_voucher_test.main);
  group('get_order_with_percentage_voucher_test', get_order_with_percentage_voucher_test.main);
  group('go_to_all_products_live_search_test', go_to_all_products_live_search_test.main);
  group('login_before_add_and_remove_from_wishlist_by_listing_test', login_before_add_and_remove_from_wishlist_by_listing_test.main);
  group('patrol_test', patrol_test.main);
  group('products_live_search_test', products_live_search_test.main);
  group('quick_filter_catalog_test', quick_filter_catalog_test.main);
  group('recently_viewed_products_test', recently_viewed_products_test.main);
  group('request_size_product_test', request_size_product_test.main);
  group('sharing_product_test', sharing_product_test.main);
  group('swiping_images_product_test', swiping_images_product_test.main);
  group('swping_images_catalog_test', swping_images_catalog_test.main);
  group('update_user_personal_info_test', update_user_personal_info_test.main);
  // END: GENERATED TEST GROUPS

  final dartTestGroup = await testExplorationCompleter.future;
  final appService = PatrolAppService(topLevelDartTestGroup: dartTestGroup);
  binding.patrolAppService = appService;
  await runAppService(appService);

  // Until now, the native test runner was waiting for us, the Dart side, to
  // come alive. Now that we did, let's tell it that we're ready to be asked
  // about Dart tests.
  await nativeAutomator.markPatrolAppServiceReady();

  await appService.testExecutionCompleted;
}
