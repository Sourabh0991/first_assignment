import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginScreen {
  final WidgetTester tester;

  LoginScreen(this.tester);

  Future<void> enterEmailId() async {
    final emailId = find.byKey(const Key('login_email_id'));

    await tester.tap(emailId);
    await tester.enterText(emailId, 'sourabhshastri1990@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> enterPassword() async {
    final password = find.byKey(const Key('login_password'));

    await tester.tap(password);
    await tester.enterText(password, 'sourabh@123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> pressLogin() async {
    final login = find.byKey(const Key('login_submit_button'));

    await tester.tap(login);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
