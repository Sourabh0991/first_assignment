import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;
import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

void main() {
  group('Delete Operation', () {
    testWidgets('Delete a user', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      await loginScreen.login();
      await Helper.pumpUntilFound(tester, find.text('Home'));
      await Helper.pumpUntilFound(tester, find.text('Ravindra Jadeja'));
      await homeScreen.pressListTile('Ravindra Jadeja');
      await tester.pumpAndSettle();
      await homeScreen.tapDeleteButton();

      expect(find.text('Ravindra Jadeja'), findsNothing);
    });
  });
}
