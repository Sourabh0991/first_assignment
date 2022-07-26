import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;
import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

void main() {
  group('Create Operation', () {
    testWidgets('Create a user', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);
      final registerScreen = RegisterScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      await loginScreen.login();
      await homeScreen.goToRegistration();
      await Helper.pumpUntilFound(tester, find.text('Registration'));
      await registerScreen.fillForm(
          fullName: 'Test Player',
          age: '20',
          email: 'test.player@gmail.com',
          phoneNo: '8397492374',
          password: 'test@123');
      await registerScreen.clickSubmitButton();
      await Helper.pumpUntilFound(tester, find.text('Home'));
      await Helper.pumpUntilFound(tester, find.text('Test Player'));

      expect(find.text('Test Player'), findsWidgets);
    });

    testWidgets('Check form validation', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);
      final registerScreen = RegisterScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      await loginScreen.login();
      await homeScreen.goToRegistration();
      await registerScreen.fillForm();
      await registerScreen.clickSubmitButton();
      await tester.pumpAndSettle();

      expect(find.text('Please enter your name', skipOffstage: false),
          findsOneWidget);
    });
  });
}
