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
    testWidgets('End-to-end Test',
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

      await tester.pumpAndSettle(const Duration(seconds: 5));

      // await Helper.pumpUntilFound(tester, find.text('Login Failed'));

      // expect(find.byWidgetPredicate((widget) => widget is Fluttertoast), findsWidgets);

      await loginScreen.clearTextFields();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      //Wrong email and correct password
      await loginScreen.enterWrongEmailId();
      await loginScreen.enterCorrectPassword();
      await loginScreen.pressLogin();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // await Helper.pumpUntilFound(
      //     tester, find.byWidgetPredicate((widget) => true));

      await loginScreen.clearTextFields();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);

      // Correct email and wrong password
      await loginScreen.enterCorrectEmailId();
      await loginScreen.enterWrongPassword();
      await loginScreen.pressLogin();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // await Helper.pumpUntilFound(
      //     tester, find.byWidgetPredicate((widget) => true));

      // expect(find.byWidgetPredicate((widget) => true), findsOneWidget);


      await loginScreen.clearTextFields();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Correct email and correct password
      await loginScreen.enterCorrectEmailId();
      await tester.pumpAndSettle();
      await loginScreen.enterCorrectPassword();
      await tester.pumpAndSettle();
      await loginScreen.pressLogin();
      await Helper.pumpUntilFound(
          tester, find.text('Home'));

      expect(find.text('Home'), findsOneWidget);

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
