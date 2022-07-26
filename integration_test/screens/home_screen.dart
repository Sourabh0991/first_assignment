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
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
  }

  Future<void> scrollDownList() async {
    await tester.drag(find.text('Hardik Pandya'), const Offset(0, -500));
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> goToRegistration() async {
    await Helper.pumpUntilFound(tester, find.byIcon(Icons.add_circle_outline));
    await tester.tap(_iconButton(Icons.add_circle_outline));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> logout() async {
    await tester.tap(_iconButton(Icons.power_settings_new));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  _iconButton(iconData) {
    return find.byIcon(iconData);
  }

  Future checkNewlyCreatedUser(String text) async {
    await tester.scrollUntilVisible(find.text('Rishabh Pant'), 10);

    final listView = tester.widget<ListView>(find.byType(ListView));


    // print('Line62 : Length : ${listView.controller!.jumpTo(100)}');

    // final list = tester.widgetList(find.byType(ListTile));
    // final countOfListItems = list.length;
    // print('Line62 Length of List : $countOfListItems');

    // if (countOfListItems > 0) {
    //   for (var listItem in list) {
    //     print('Line65: $listItem');
    //   }
    // } else {
    //   print('Line65: No list item');
    // }
  }
}
