import 'dart:async';

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
}
