import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_assignment/models/user_model.dart';

class Helper {
  static Future<void> pumpUntilFound(WidgetTester tester, Finder finder,
      {Duration timeout = const Duration(seconds: 30)}) async {
    bool timerDone = false;
    final timer = Timer(timeout, () => fail('Pump has timed out'));
    while (!timerDone) {
      await tester.pumpAndSettle();
      timerDone |= tester.any(finder);
      await Future.delayed(const Duration(milliseconds: 100));
    }
    timer.cancel();
  }

  static checkPosition(int index, User user, {bool isOnPosition = true}) {
    final listItemFinder = find.byType(ListTile);
    final listItem =
        listItemFinder.evaluate().isEmpty ? null : listItemFinder.at(index);
    if (listItem == null) {
      if (isOnPosition) {
        fail('List not found');
      }
      return;
    }
    final positionText = find.text(user.name);
    expect(find.descendant(of: listItem, matching: positionText),
        isOnPosition ? findsOneWidget : findsNothing);
  }
}
