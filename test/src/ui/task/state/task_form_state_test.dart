import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_template/src/ui/task/state/task_form_state.dart';

void main() {
  group('TaskFormState', () {
    test('初期状態が正しく設定されていること', () {
      final state = TaskFormState();

      expect(state.name, '');
      expect(state.repeatType, 'daily');
      expect(state.categoryId, null);
      expect(state.reminderTime, null);
      expect(state.isSubmitting, false);
      expect(state.errorMessage, null);
    });

    test('copyWithメソッドが正しく動作すること', () {
      final initialState = TaskFormState();

      // name を更新
      final nameUpdated = initialState.copyWith(name: 'テストタスク');
      expect(nameUpdated.name, 'テストタスク');
      expect(nameUpdated.repeatType, initialState.repeatType); // 他のプロパティは変更なし

      // repeatType を更新
      final typeUpdated = initialState.copyWith(repeatType: 'weekly');
      expect(typeUpdated.repeatType, 'weekly');
      expect(typeUpdated.name, initialState.name); // 他のプロパティは変更なし

      // categoryId を更新
      final categoryUpdated = initialState.copyWith(categoryId: 'cat1');
      expect(categoryUpdated.categoryId, 'cat1');

      // reminderTime を更新
      final time = const TimeOfDay(hour: 10, minute: 30);
      final timeUpdated = initialState.copyWith(reminderTime: time);
      expect(timeUpdated.reminderTime, time);

      // isSubmitting を更新
      final submittingUpdated = initialState.copyWith(isSubmitting: true);
      expect(submittingUpdated.isSubmitting, true);

      // errorMessage を更新
      final errorUpdated = initialState.copyWith(errorMessage: 'エラー発生');
      expect(errorUpdated.errorMessage, 'エラー発生');

      // 複数のプロパティを同時に更新
      final multiUpdated = initialState.copyWith(
        name: '複数更新',
        repeatType: 'weekly',
        isSubmitting: true,
      );
      expect(multiUpdated.name, '複数更新');
      expect(multiUpdated.repeatType, 'weekly');
      expect(multiUpdated.isSubmitting, true);
    });

    test('clearCategoryIdメソッドが正しく動作すること', () {
      // カテゴリIDがある状態から始める
      final state = TaskFormState(categoryId: 'cat1');
      expect(state.categoryId, 'cat1');

      // clearCategoryIdメソッドの呼び出し
      final clearedState = state.clearCategoryId();

      // 直接clearCategoryIdメソッドの実装と同じ処理をして期待値を作成
      final expectedState = TaskFormState(
        name: state.name,
        repeatType: state.repeatType,
        categoryId: null, // ここだけnullに
        reminderTime: state.reminderTime,
        isSubmitting: state.isSubmitting,
        errorMessage: state.errorMessage,
      );

      // 結果を検証
      expect(clearedState.categoryId, expectedState.categoryId);
      expect(clearedState.name, expectedState.name);
      expect(clearedState.repeatType, expectedState.repeatType);
    });

    test('clearReminderTimeメソッドが正しく動作すること', () {
      // リマインダー時刻がある状態から始める
      final time = const TimeOfDay(hour: 10, minute: 30);
      final state = TaskFormState(reminderTime: time);
      expect(state.reminderTime, time);

      // clearReminderTimeメソッドの呼び出し
      final clearedState = state.clearReminderTime();

      // 直接clearReminderTimeメソッドの実装と同じ処理をして期待値を作成
      final expectedState = TaskFormState(
        name: state.name,
        repeatType: state.repeatType,
        categoryId: state.categoryId,
        reminderTime: null, // ここだけnullに
        isSubmitting: state.isSubmitting,
        errorMessage: state.errorMessage,
      );

      // 結果を検証
      expect(clearedState.reminderTime, expectedState.reminderTime);
      expect(clearedState.name, expectedState.name);
      expect(clearedState.repeatType, expectedState.repeatType);
    });

    test('clearErrorメソッドが正しく動作すること', () {
      // エラーメッセージがある状態から始める
      final state = TaskFormState(errorMessage: 'エラー発生');
      expect(state.errorMessage, 'エラー発生');

      // clearErrorメソッドの呼び出し
      final clearedState = state.clearError();

      // 直接clearErrorメソッドの実装と同じ処理をして期待値を作成
      final expectedState = TaskFormState(
        name: state.name,
        repeatType: state.repeatType,
        categoryId: state.categoryId,
        reminderTime: state.reminderTime,
        isSubmitting: state.isSubmitting,
        errorMessage: null, // ここだけnullに
      );

      // 結果を検証
      expect(clearedState.errorMessage, expectedState.errorMessage);
      expect(clearedState.name, expectedState.name);
      expect(clearedState.repeatType, expectedState.repeatType);
    });
  });

  group('taskFormStateProvider', () {
    test('Providerが正しく初期化されること', () {
      // Providerのテストは通常、ウィジェットテスト内で行う
      // ここでは基本的な存在確認のみ
      expect(taskFormStateProvider, isNotNull);
    });
  });
}
