import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/main.dart' as main_app;
import '../helper.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

void main() {
  group('Delete Operation', () {
    const deleteThisUser = 'Ravindra Jadeja';
    
    testWidgets('Delete a user', (WidgetTester tester) async {
      main_app.main();

      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      final loginScreen = LoginScreen(tester);
      await loginScreen.login();
      await Helper.pumpUntilFound(tester, find.text('Home'));
      await Helper.scrollUntilFound(tester, deleteThisUser);
      await Helper.pumpUntilFound(tester, find.text(deleteThisUser));
      final homeScreen = HomeScreen(tester);
      await homeScreen.pressListTile(deleteThisUser);
      await tester.pumpAndSettle();
      await homeScreen.tapDeleteButton();

      expect(find.text(deleteThisUser), findsNothing);
    });

    testWidgets('Confirm delete operation', (WidgetTester tester) async {
      main_app.main();

      final loginScreen = LoginScreen(tester);
      await Helper.pumpUntilFound(tester, find.byType(ElevatedButton));
      await loginScreen.login();
      await Helper.pumpUntilFound(tester, find.text('Home'));
      await Helper.scrollUntilFound(tester, deleteThisUser, matcher: findsNothing);
      await tester.pumpAndSettle();
    });
  });
}
