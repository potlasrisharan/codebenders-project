import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:labhsaathi_app/main.dart';

void main() {
  testWidgets('app starts on the landing screen', (WidgetTester tester) async {
    await tester.pumpWidget(const LabhSaathiApp());
    await tester.pumpAndSettle();
    expect(find.text('Get started'), findsWidgets);
  });
}
