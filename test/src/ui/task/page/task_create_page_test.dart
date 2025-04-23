import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_template/src/ui/task/page/task_create_page.dart';

void main() {
  testWidgets('TaskCreatePage renders correctly', (WidgetTester tester) async {
    // TaskCreatePage をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TaskCreatePage())),
    );

    // アプリバーのタイトルが正しく表示されていることを確認
    expect(find.text('タスク登録'), findsOneWidget);

    // ヘルプアイコンが表示されていることを確認
    expect(find.byIcon(Icons.help_outline), findsOneWidget);

    // タスクフォームが表示されていることを確認（直接的なテスト）
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Help dialog opens when help icon is tapped', (
    WidgetTester tester,
  ) async {
    // TaskCreatePage をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TaskCreatePage())),
    );

    // ヘルプアイコンをタップ
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle(); // アニメーションが完了するまで待機

    // ダイアログのタイトルが表示されていることを確認
    expect(find.text('タスク登録について'), findsOneWidget);

    // ヘルプ内容が表示されていることを確認
    expect(find.text('タスク名'), findsWidgets); // ダイアログ内にもタスク名が表示される
    expect(find.text('繰り返しタイプ'), findsWidgets);
    expect(find.text('リマインダー時刻'), findsWidgets);

    // 閉じるボタンが表示されていることを確認
    expect(find.text('閉じる'), findsOneWidget);
  });

  testWidgets('Help dialog closes when close button is tapped', (
    WidgetTester tester,
  ) async {
    // TaskCreatePage をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TaskCreatePage())),
    );

    // ヘルプアイコンをタップしてダイアログを開く
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();

    // ダイアログが表示されていることを確認
    expect(find.text('タスク登録について'), findsOneWidget);

    // 閉じるボタンをタップ
    await tester.tap(find.text('閉じる'));
    await tester.pumpAndSettle();

    // ダイアログが閉じられていることを確認
    expect(find.text('タスク登録について'), findsNothing);
  });

  testWidgets('Help dialog has correct description texts', (
    WidgetTester tester,
  ) async {
    // TaskCreatePage をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TaskCreatePage())),
    );

    // ヘルプアイコンをタップ
    await tester.tap(find.byIcon(Icons.help_outline));
    await tester.pumpAndSettle();

    // 各ヘルプ項目の説明文が正しく表示されていることを確認
    expect(find.text('毎日または毎週繰り返し行うタスクの名前を入力します。'), findsOneWidget);

    expect(
      find.text('「毎日」または「毎週」から選択します。毎週の場合は、登録した曜日に表示されます。'),
      findsOneWidget,
    );

    expect(find.text('タスクを実行する時刻を設定することで、その時刻に通知でお知らせします。'), findsOneWidget);
  });
}
