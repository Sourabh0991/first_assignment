import 'package:flutter_test/flutter_test.dart';

import '../helper.dart';

class RegisterScreen {
  final WidgetTester tester;

  RegisterScreen(this.tester);

  Future<void> fillForm() async {
    await tester.tap(find.bySemanticsLabel('Full Name'));
    await tester.enterText(find.bySemanticsLabel('Full Name'), 'Test Player');

    await tester.enterText(find.bySemanticsLabel('Age'), '25');

    await tester.enterText(find.bySemanticsLabel('Phone No.'), '1234567890');

    await tester.enterText(
        find.bySemanticsLabel('Email Address'), 'test.player@gmail.com');

    await tester.enterText(find.bySemanticsLabel('Set Password'), 'test@123');

  }

  Future<void> clickSubmitButton() async {

    await tester.tap(find.text('Submit'));

    await Helper.pumpUntilFound(tester, find.text('Test Player'));

  }
}
