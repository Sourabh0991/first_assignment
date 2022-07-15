import 'package:first_assignment/main.dart' as main_app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  LoginScreen loginScreen;
  HomeScreen homeScreen;

  group("First Assignment Integration Test", () {

    testWidgets('End to End Test', (WidgetTester tester) async {
      main_app.main(); // Launches app from main()

      loginScreen = LoginScreen(tester);
      homeScreen = HomeScreen(tester);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      //Operations of Login Screen
      await loginScreen.enterEmailId();
      await loginScreen.enterPassword();
      await loginScreen.pressLogin();

      //Operations of Home Screen
      // await homeScreen.pressListTile();
      // await homeScreen.scrollDownList();
      await homeScreen.logout();
    });

  });
  
}
