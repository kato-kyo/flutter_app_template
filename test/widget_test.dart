// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_template/main.dart';

void main() {
  testWidgets('App should launch without errors', (WidgetTester tester) async {
    // アプリをレンダリング
    await tester.pumpWidget(const ProviderScope(child: MainApp()));

    // スキャフォールドが存在することを確認
    expect(find.byType(Scaffold), findsOneWidget);

    // アプリバーが存在することを確認
    expect(find.byType(AppBar), findsOneWidget);
  });
}
