import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

  static Future<void> scrollUntilFound(WidgetTester tester, String text,
      {matcher = findsOneWidget}) async {
    final listFinder = find.byType(Scrollable);
    final itemFinder = find.text(text);
    await tester
        .scrollUntilVisible(
          itemFinder,
          500.0,
          scrollable: listFinder,
        )
        .onError((error, stackTrace) => expect(find.text(text), matcher))
        .then((value) => expect(find.text(text), findsOneWidget));
  }
}
