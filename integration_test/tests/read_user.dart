import 'package:first_assignment/values/string_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;
import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

void main() {
  group('Read Operation', () {

    testWidgets('Read records from list item', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      var textToSearch = 'Rishabh Pant';

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      await loginScreen.login();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      await Helper.scrollUntilFound(tester, textToSearch);
      await tester.pumpAndSettle();
      final homeScreen = HomeScreen(tester);
      await homeScreen.pressListTile(textToSearch);
      await Helper.pumpUntilFound(
          tester, find.text(StringValues.updateDeleteDialogTitle));
    });
  });
}
