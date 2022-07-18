import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper.dart';

class LoginScreen {
  final WidgetTester tester;

  LoginScreen(this.tester);

  final emailId = find.bySemanticsLabel('Email Address');
  final password = find.bySemanticsLabel('Password');

  Future<void> enterCorrectEmailId() async {
    // final emailId = find.byKey(const Key('login_email_id'));

    await tester.tap(emailId);
    await tester.enterText(emailId, 'sourabhshastri1990@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> enterCorrectPassword() async {
    // final password = find.byKey(const Key('login_password'));

    await tester.tap(password);
    await tester.enterText(password, 'sourabh@123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> enterWrongEmailId() async {

    await tester.tap(emailId);
    await tester.enterText(emailId, 'wrong@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> enterWrongPassword() async {

    await tester.tap(password);
    await tester.enterText(password, 'Wrong@123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> pressLogin() async {
    // final login = find.byKey(const Key('login_submit_button'));
    final login = find.byType(ElevatedButton);

    await tester.tap(login);
    // await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> clearTextFields() async {
    await tester.tap(emailId);
    await tester.enterText(emailId, '');

    await tester.tap(password);
    await tester.enterText(password, '');

    // await tester.pumpAndSettle(const Duration(seconds: 2));

    // await tester.showKeyboard(emailId);

    // await simulateKeyDownEvent(LogicalKeyboardKey.backspace);

    // await simulateKeyRepeatEvent(LogicalKeyboardKey.backspace);
    
    // await simulateKeyDownEvent(LogicalKeyboardKey.backspace);
  }
}
