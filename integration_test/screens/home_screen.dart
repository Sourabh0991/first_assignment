import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper.dart';

class HomeScreen {
  final WidgetTester tester;
  HomeScreen(this.tester);

  Future<void> pressListTile(String msg) async {
    final listTile = find.text(msg);

    await tester.tap(listTile);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> tapCancelButton() async {
    final cancelButton = find.text('Cancel');

    await tester.tap(cancelButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> updateRecord(String newPhoneNo) async {
    final phoneNoTextField = find.bySemanticsLabel('Phone No.');
    final updateButton = find.text('Update');

    await tester.enterText(phoneNoTextField, newPhoneNo);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(updateButton);
  }

  Future<void> tapDeleteButton() async {
    final deleteButton = find.text('Delete');

    await tester.tap(deleteButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> scrollDownList() async {
    await tester.drag(find.text('Hardik Pandya'), const Offset(0, -500));
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> goToRegistration() async {
    await Helper.pumpUntilFound(tester, find.byIcon(Icons.add_circle_outline));
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
