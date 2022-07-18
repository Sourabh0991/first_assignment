import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;

import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

void main() {
  group('Update Operation', () {
    testWidgets('Update a record from list item', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);

      const String updatePhoneNo = '1284388382';

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.loginSuccessfully();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      await Helper.pumpUntilFound(tester, find.text('Ravindra Jadeja'));
      await homeScreen.pressListTile('Ravindra Jadeja');
      await homeScreen.updateRecord(updatePhoneNo);

      await Helper.pumpUntilFound(tester, find.textContaining(updatePhoneNo));

      expect(find.textContaining(updatePhoneNo, skipOffstage: false), findsOneWidget);
    });

    testWidgets('Check form validation', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);
      final registerScreen = RegisterScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.loginSuccessfully();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      await Helper.pumpUntilFound(tester, find.text('Ravindra Jadeja'));
      await homeScreen.pressListTile('Ravindra Jadeja');
      await Helper.pumpUntilFound(tester, find.text('Update/Delete Record'));

      await registerScreen.fillForm();
      await registerScreen.clickUpdateButton();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.bySemanticsLabel('Please enter your name'), findsOneWidget);
    });
  });
}
