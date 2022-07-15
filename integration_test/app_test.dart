import 'package:first_assignment/main.dart' as main_app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helper.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  LoginScreen loginScreen;
  HomeScreen homeScreen;

  group("First Assignment Integration Test", () {
    testWidgets('Login - Wrong email and wrong password',
        (WidgetTester tester) async {
      main_app.main(); // Launches app from main()

      loginScreen = LoginScreen(tester);
      homeScreen = HomeScreen(tester);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      //Operations of Login Screen

      //Wrong email and wrong password
      await loginScreen.enterWrongEmailId();
      await loginScreen.enterWrongPassword();
      await loginScreen.pressLogin();
      await Helper.pumpUntilFound(
          tester, find.byWidgetPredicate((widget) => true));

      await loginScreen.clearTextFields();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      //Wrong email and correct password
      // await loginScreen.enterWrongEmailId();
      // await loginScreen.enterCorrectPassword();
      // await loginScreen.pressLogin();
      // await Helper.pumpUntilFound(
      //     tester, find.byWidgetPredicate((widget) => true));

      // await loginScreen.clearTextFields();
      // await tester.pumpAndSettle(const Duration(seconds: 5));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      // // Correct email and wrong password
      // await loginScreen.enterCorrectEmailId();
      // await loginScreen.enterWrongPassword();
      // await loginScreen.pressLogin();
      // await Helper.pumpUntilFound(
      //     tester, find.byWidgetPredicate((widget) => true));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      // // Correct email and correct password
      // await loginScreen.enterCorrectEmailId();
      // await loginScreen.enterCorrectPassword();
      // await loginScreen.pressLogin();
      // await Helper.pumpUntilFound(
      //     tester, find.byWidgetPredicate((widget) => true));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      //Operations of Home Screen
      // await homeScreen.pressListTile();
      // await homeScreen.scrollDownList();
    });

    // testWidgets('Login - Wrong email and correct password',
    //     (WidgetTester tester) async {
    //   // main_app.main(); // Launches app from main()

    //   loginScreen = LoginScreen(tester);
    //   homeScreen = HomeScreen(tester);

    //   await tester.pumpAndSettle(const Duration(seconds: 2));

    //   //Wrong email and correct password
    //   await loginScreen.enterWrongEmailId();
    //   await loginScreen.enterCorrectPassword();
    //   await loginScreen.pressLogin();
    //   await Helper.pumpUntilFound(
    //       tester, find.byWidgetPredicate((widget) => true));

    //   await loginScreen.clearTextFields();
    //   await tester.pumpAndSettle(const Duration(seconds: 5));

    //   expect(find.byWidgetPredicate((widget) => true), findsOneWidget);
    // });
  });
}
