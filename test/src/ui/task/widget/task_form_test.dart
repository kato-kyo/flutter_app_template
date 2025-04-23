import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_template/src/ui/task/widget/task_form.dart';
import 'package:flutter_app_template/src/ui/task/state/task_form_state.dart';

void main() {
  testWidgets('TaskForm displays all required fields', (
    WidgetTester tester,
  ) async {
    // TaskForm をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: Scaffold(body: TaskForm()))),
    );

    // すべての必要なフィールドと要素が存在するか確認
    expect(find.text('タスク名'), findsOneWidget);
    expect(find.text('繰り返しタイプ'), findsOneWidget);
    expect(find.text('リマインダー時刻（任意）'), findsOneWidget);
    expect(find.text('毎日'), findsOneWidget);
    expect(find.text('保存する'), findsOneWidget);
  });

  testWidgets('TaskForm validates empty task name', (
    WidgetTester tester,
  ) async {
    // TaskForm をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: Scaffold(body: TaskForm()))),
    );

    // 名前を入力せずに保存ボタンをタップ
    await tester.tap(find.text('保存する'));
    await tester.pump();

    // バリデーションエラーメッセージが表示されることを確認
    expect(find.text('タスク名を入力してください'), findsOneWidget);
  });

  testWidgets('TaskForm validates too long task name', (
    WidgetTester tester,
  ) async {
    // TaskForm をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: Scaffold(body: TaskForm()))),
    );

    // 51文字の長いタスク名を入力
    final longText = 'あ' * 51;
    await tester.enterText(find.byType(TextFormField).first, longText);
    await tester.tap(find.text('保存する'));
    await tester.pump();

    // バリデーションエラーメッセージが表示されることを確認
    expect(find.text('タスク名は50文字以内で入力してください'), findsOneWidget);
  });

  testWidgets('TaskForm updates state when inputs change', (
    WidgetTester tester,
  ) async {
    // TaskForm をレンダリング
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: Scaffold(body: TaskForm()))),
    );

    // タスク名を入力
    await tester.enterText(find.byType(TextFormField).first, 'テストタスク');
    await tester.pump();

    // 繰り返しタイプを「毎週」に変更
    await tester.tap(find.text('毎日'));
    await tester.pump();
    await tester.tap(find.text('毎週').last);
    await tester.pump();

    // 状態が更新されたことを確認（UIの変更で確認）
    expect(find.text('毎週同じ曜日に繰り返すタスクとして登録します'), findsOneWidget);
  });

  testWidgets('Save button shows loading indicator when submitting', (
    WidgetTester tester,
  ) async {
    // カスタムProviderScopeでTaskFormをレンダリング
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          taskFormStateProvider.overrideWith(
            (ref) => TaskFormState(isSubmitting: true),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: TaskForm())),
      ),
    );

    // 送信中に保存ボタンにローディングインジケーターが表示されることを確認
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('保存する'), findsNothing); // テキストは非表示
  });
}
