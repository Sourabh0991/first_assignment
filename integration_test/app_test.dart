import 'package:first_assignment/main.dart' as mainApp;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'screens/login_screen.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  LoginScreen loginScreen;

  group("First Assignment Integration Test", () {

    testWidgets('End to End Test', (WidgetTester tester) async {
      mainApp.main(); // Launches app from main()

      loginScreen = LoginScreen(tester);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      //Operations of Login Screen
      await loginScreen.enterEmailId();
      await loginScreen.enterPassword();
      await loginScreen.pressLogin();
    });

  });
  
}
