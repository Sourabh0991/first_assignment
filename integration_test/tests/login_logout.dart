import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;

import '../helper.dart';
import '../screens/login_screen.dart';

void main() {
  group('Login and Logout Test Cases', () {
    testWidgets('Empty email and password', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.pressLogin();

      expect(find.text('Home'), findsNothing);
    });

    testWidgets('Successful Login and Logout', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.enterCorrectEmailId();
      await tester.pumpAndSettle();
      await loginScreen.enterCorrectPassword();
      await tester.pumpAndSettle();
      await loginScreen.pressLogin();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('Wrong email and wrong password', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.enterWrongEmailId();
      await loginScreen.enterWrongPassword();
      await loginScreen.pressLogin();

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('Home'), findsNothing);
    });

    testWidgets('Wrong email and correct password',
        (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.enterWrongEmailId();
      await loginScreen.enterCorrectPassword();
      await loginScreen.pressLogin();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('Home'), findsNothing);
    });

    testWidgets('Correct email and wrong password',
        (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.enterCorrectEmailId();
      await loginScreen.enterWrongPassword();
      await loginScreen.pressLogin();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('Home'), findsNothing);
    });
  });
}
