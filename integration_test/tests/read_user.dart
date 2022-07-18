import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;

import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

void main() {
  group('Read Operation', () {
    testWidgets('Read a record from list item', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.loginSuccessfully();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      await homeScreen.pressListTile('Ravindra Jadeja');
      await Helper.pumpUntilFound(tester, find.text('Ravindra Jadeja'));

      expect(find.text('Ravindra Jadeja'), findsWidgets);
    });

    testWidgets('Scroll list', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      final homeScreen = HomeScreen(tester);

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));

      await loginScreen.loginSuccessfully();
      await Helper.pumpUntilFound(tester, find.text('Home'));

      await homeScreen.scrollDownList();

      expect(find.text('Rishabh Pant'), findsOneWidget);
    });
  });
}
