import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helper.dart';

class HomeScreen {
  final WidgetTester tester;
  HomeScreen(this.tester);

  Future<void> pressListTile(String msg) async {
    final listTile = find.text(msg);
    await tapPumpSettle(listTile);
  }

  Future<void> tapCancelButton() async {
    final cancelButton = find.text('Cancel');
    await tapPumpSettle(cancelButton);
  }

  Future<void> updateRecord(String newPhoneNo) async {
    final phoneNoTextField = find.bySemanticsLabel('Phone No.');
    final updateButton = find.text('Update');

    await tester.enterText(phoneNoTextField, newPhoneNo);
    await tester.pumpAndSettle();
    await tester.tap(updateButton);
  }

  Future<void> tapDeleteButton() async {
    final deleteButton = find.text('Delete');
    await tapPumpSettle(deleteButton);
  }

  Future<void> scrollDownList() async {
    await tester.drag(find.text('Hardik Pandya'), const Offset(0, -500));
    await tester.pumpAndSettle();
  }

  Future<void> goToRegistration() async {
    await Helper.pumpUntilFound(tester, find.byIcon(Icons.add_circle_outline));
    tapPumpSettle(_iconButton(Icons.add_circle_outline));
  }

  Future<void> logout() async {
    tapPumpSettle(_iconButton(Icons.power_settings_new));
  }

  _iconButton(iconData) {
    return find.byIcon(iconData);
  }

  Future tapPumpSettle(finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
