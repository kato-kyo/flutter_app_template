import 'package:flutter_app_template/src/core/util/result.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/task_name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskName', () {
    test('create should return success result for valid input', () {
      // 準備
      const input = 'タスク名';

      // 実行
      final result = TaskName.create(input);

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.value, input);
    });

    test('create should trim input', () {
      // 準備
      const rawInput = '  タスク名  ';
      const expectedValue = 'タスク名';

      // 実行
      final result = TaskName.create(rawInput);

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.value, expectedValue);
    });

    test('create should return failure for empty input', () {
      // 準備・実行
      final result1 = TaskName.create('');
      final result2 = TaskName.create('   ');

      // 検証
      expect(result1.isFailure, true);
      expect(result1.error, isA<DomainError>());
      expect((result1.error as DomainError).message, 'タスク名を入力してください');

      expect(result2.isFailure, true);
      expect(result2.error, isA<DomainError>());
      expect((result2.error as DomainError).message, 'タスク名を入力してください');
    });

    test('create should return failure for input exceeding 50 characters', () {
      // 準備
      final longInput = 'あ' * 51; // 51文字

      // 実行
      final result = TaskName.create(longInput);

      // 検証
      expect(result.isFailure, true);
      expect(result.error, isA<DomainError>());
      expect((result.error as DomainError).message, 'タスク名は50文字以内で入力してください');
    });

    test('equality should work correctly', () {
      // 準備
      final result1 = TaskName.create('タスク名');
      final result2 = TaskName.create('タスク名');
      final result3 = TaskName.create('別のタスク名');

      // 検証
      expect(result1.value == result2.value, true);
      expect(result1.value == result3.value, false);
      expect(result1.value.hashCode == result2.value.hashCode, true);
      expect(result1.value.hashCode == result3.value.hashCode, false);
    });

    test('toString should return formatted string', () {
      // 準備
      final result = TaskName.create('タスク名');

      // 検証
      expect(result.value.toString(), 'TaskName(タスク名)');
    });
  });
}
