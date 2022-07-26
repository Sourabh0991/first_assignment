import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginScreen {
  final WidgetTester tester;

  LoginScreen(this.tester);

  final emailId = find.bySemanticsLabel('Email Address');
  final password = find.bySemanticsLabel('Password');

  Future<void> enterCorrectEmailId() async {
    await tester.tap(emailId);
    await tester.enterText(emailId, 'sourabhshastri1990@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> enterCorrectPassword() async {
    await tester.tap(password);
    await tester.enterText(password, 'sourabh@123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> enterWrongEmailId() async {
    await tester.tap(emailId);
    await tester.enterText(emailId, 'wrong@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> enterWrongPassword() async {
    await tester.tap(password);
    await tester.enterText(password, 'Wrong@123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> pressLogin() async {
    final login = find.byType(ElevatedButton);

    await tester.tap(login);
  }

  Future<void> clearTextFields() async {
    await tester.tap(emailId);
    await tester.enterText(emailId, '');

    await tester.tap(password);
    await tester.enterText(password, '');
  }

  Future<void> login() async {
    await enterCorrectEmailId();
    await tester.pumpAndSettle();
    await enterCorrectPassword();
    await tester.pumpAndSettle();
    await pressLogin();
  }
}
