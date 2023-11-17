import 'package:flutter_test/flutter_test.dart';
import 'package:bambinifashion/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'base_test.dart';
import 'pages/cart.dart';
import 'pages/checkout.dart';
import 'pages/login.dart';
import 'pages/menu.dart';
import 'pages/nav_bar.dart';


void main() {
 IntegrationTestWidgetsFlutterBinding.ensureInitialized();


 group('wishlist test', () {
   testWidgets('add to wishlist from listing auth test', (tester) async {
     //final FlutterExceptionHandler? originalOnError = FlutterError.onError;
     final navBar = NavBar(tester);
     final cart = Cart(tester);
     final checkout = Checkout(tester, cart);
     final login = Login(tester, checkout);
     final menu = Menu(tester, navBar, login);

     app.main();
     await tester.pumpAndSettle();
     await menu.goToMenuCategory(menu.newIn);
     // reset onError after calling pumpAndSettle()
     //FlutterError.onError = originalOnError;
   });
 });
}

