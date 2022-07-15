import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeScreen {
  final WidgetTester tester;
  HomeScreen(this.tester);

  Future<void> pressListTile() async {
    final listTile = find.byKey(const Key('qByZ4r6yhbiZAAaN3DwD'));
    final cancelButton = find.byKey(const Key('user_form_cancel_button'));

    await tester.tap(listTile);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(cancelButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));

  }

  Future<void> scrollDownList() async {
    // Need to check with Rajesh
    final list = find.byKey(const Key('users_list'));
    final listTile = find.byKey(const Key('xWmmPXPwBJs3qlxJxx0e'));


    await tester.scrollUntilVisible(list, -300);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    // final gesture = await tester
    //     .startGesture(const Offset(0, 300)); //Position of the scrollview
    // await gesture.moveBy(const Offset(0, -300)); //How much to scroll by
    // await tester.pump();
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
