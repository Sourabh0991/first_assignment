import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeScreen {
  final WidgetTester tester;
  HomeScreen(this.tester);

  final list = find.byKey(const Key('users_list'));

  Future<void> pressListTile() async {
    final listTile = find.text('Ravindra Jadeja');
    final cancelButton = find.text('Cancel');

    await tester.tap(listTile);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(cancelButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> scrollDownList() async {
    // Need to check with Rajesh

    // await tester.scrollUntilVisible(list, -300);

    await tester.drag(find.text('Hardik Pandya'), const Offset(0, -500));
    await tester.pumpAndSettle(const Duration(seconds: 10));

  }

  Future<void> goToRegistration() async {
    final iconButton = find.byIcon(Icons.add_circle_outline);

    await tester.tap(iconButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> logout() async {
    final iconButton = find.byIcon(Icons.power_settings_new);

    await tester.tap(iconButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
