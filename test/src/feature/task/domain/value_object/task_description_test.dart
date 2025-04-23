import 'package:flutter_app_template/src/core/util/result.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/task_description.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskDescription', () {
    test('create should return success result for valid input', () {
      // 準備
      const input = 'タスクの説明';

      // 実行
      final result = TaskDescription.create(input);

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.value, input);
    });

    test('create should return success result for empty input', () {
      // 準備
      const input = '';

      // 実行
      final result = TaskDescription.create(input);

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.value, input);
    });

    test('create should trim input', () {
      // 準備
      const rawInput = '  タスクの説明  ';
      const expectedValue = 'タスクの説明';

      // 実行
      final result = TaskDescription.create(rawInput);

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.value, expectedValue);
    });

    test(
      'create should return failure for input exceeding 1000 characters',
      () {
        // 準備
        final longInput = 'あ' * 1001; // 1001文字

        // 実行
        final result = TaskDescription.create(longInput);

        // 検証
        expect(result.isFailure, true);
        expect(result.error, isA<DomainError>());
        expect(
          (result.error as DomainError).message,
          'タスクの説明は1000文字以内で入力してください',
        );
      },
    );

    test('equality should work correctly', () {
      // 準備
      final result1 = TaskDescription.create('説明文');
      final result2 = TaskDescription.create('説明文');
      final result3 = TaskDescription.create('別の説明文');
      final result4 = TaskDescription.create('');
      final result5 = TaskDescription.create('');

      // 検証
      expect(result1.value == result2.value, true);
      expect(result1.value == result3.value, false);
      expect(result4.value == result5.value, true);
      expect(result1.value == result4.value, false);
      expect(result1.value.hashCode == result2.value.hashCode, true);
      expect(result1.value.hashCode == result3.value.hashCode, false);
    });

    test('toString should return formatted string', () {
      // 準備
      final result1 = TaskDescription.create('説明文');
      final result2 = TaskDescription.create('');

      // 検証
      expect(result1.value.toString(), 'TaskDescription(説明文)');
      expect(result2.value.toString(), 'TaskDescription()');
    });
  });
}
