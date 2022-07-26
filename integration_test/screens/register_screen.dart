import 'package:flutter_test/flutter_test.dart';

class RegisterScreen {
  final WidgetTester tester;

  RegisterScreen(this.tester);

  Future<void> fillForm(
      {String fullName = '',
      String age = '',
      String phoneNo = '',
      String email = '',
      String password = ''}) async {
    await tester.tap(find.bySemanticsLabel('Full Name'));
    await tester.enterText(find.bySemanticsLabel('Full Name'), fullName);
    await tester.enterText(find.bySemanticsLabel('Age'), age);
    await tester.enterText(find.bySemanticsLabel('Phone No.'), phoneNo);
    await tester.enterText(find.bySemanticsLabel('Email Address'), email);
    await tester.enterText(find.bySemanticsLabel('Set Password'), password);
  }

  Future<void> clickSubmitButton() async {
    await tester.tap(find.text('Submit'));
  }

  Future<void> clickUpdateButton() async {
    await tester.tap(find.text('Update'));
  }
}
