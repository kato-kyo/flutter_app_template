import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/util/result.dart';
import 'package:flutter_app_template/src/feature/task/domain/entity/task.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/category_id.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/repeat_type.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/task_description.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/task_id.dart';
import 'package:flutter_app_template/src/feature/task/domain/value_object/task_name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task', () {
    late TaskName validName;
    late TaskDescription validDescription;
    late TaskDescription emptyDescription;
    late RepeatType dailyRepeatType;

    setUp(() {
      // 有効なテストデータをセットアップ
      validName = TaskName.create('テストタスク').value;
      validDescription = TaskDescription.create('テストの説明文').value;
      emptyDescription = TaskDescription.create('').value;
      dailyRepeatType = RepeatType.daily;
    });

    test('create should return success result with valid input', () {
      // 実行
      final result = Task.create(
        validName,
        validDescription,
        dailyRepeatType,
        null,
        null,
      );

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.name, validName);
      expect(result.value.description, validDescription);
      expect(result.value.repeatType, dailyRepeatType);
      expect(result.value.categoryId, isNull);
      expect(result.value.reminderTime, isNull);
    });

    test('create should return success result with empty description', () {
      // 実行
      final result = Task.create(
        validName,
        emptyDescription,
        dailyRepeatType,
        null,
        null,
      );

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.description, emptyDescription);
    });

    test('create should accept optional category ID', () {
      // 準備
      final categoryId = CategoryId.fromString('category-1');

      // 実行
      final result = Task.create(
        validName,
        validDescription,
        dailyRepeatType,
        categoryId,
        null,
      );

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.categoryId, categoryId);
    });

    test('create should accept optional reminder time', () {
      // 準備
      final reminderTime = const TimeOfDay(hour: 9, minute: 0);

      // 実行
      final result = Task.create(
        validName,
        validDescription,
        dailyRepeatType,
        null,
        reminderTime,
      );

      // 検証
      expect(result.isSuccess, true);
      expect(result.value.reminderTime, reminderTime);
    });

    test('reconstitute should create Task from raw values', () {
      // 実行
      final task = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: 'テストの説明文',
        repeatTypeStr: 'daily',
        categoryId: 'category-1',
        reminderHour: 9,
        reminderMinute: 0,
      );

      // 検証
      expect(task.id.value, 'task-1');
      expect(task.name.value, 'テストタスク');
      expect(task.description.value, 'テストの説明文');
      expect(task.repeatType, RepeatType.daily);
      expect(task.categoryId?.value, 'category-1');
      expect(task.reminderTime?.hour, 9);
      expect(task.reminderTime?.minute, 0);
    });

    test('reconstitute should accept empty description', () {
      // 実行
      final task = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: '',
        repeatTypeStr: 'daily',
      );

      // 検証
      expect(task.description.value, '');
    });

    test('reconstitute should throw for invalid name', () {
      // 検証
      expect(
        () => Task.reconstitute(
          id: 'task-1',
          name: '', // 空の名前は無効
          repeatTypeStr: 'daily',
        ),
        throwsA(isA<DomainError>()),
      );
    });

    test('reconstitute should throw for invalid description length', () {
      // 検証
      expect(
        () => Task.reconstitute(
          id: 'task-1',
          name: 'テストタスク',
          description: 'あ' * 1001, // 1001文字の説明は無効
          repeatTypeStr: 'daily',
        ),
        throwsA(isA<DomainError>()),
      );
    });

    test('copyWith should update specified fields only', () {
      // 準備
      final task = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: '元の説明',
        repeatTypeStr: 'daily',
        categoryId: 'category-1',
        reminderHour: 9,
        reminderMinute: 0,
      );

      final newName = TaskName.create('新しいタスク名').value;
      final newDescription = TaskDescription.create('新しい説明').value;

      // 実行
      final updatedTask = task.copyWith(
        name: newName,
        description: newDescription,
      );

      // 検証
      expect(updatedTask.id, task.id); // 変更なし
      expect(updatedTask.name, newName); // 更新
      expect(updatedTask.description, newDescription); // 更新
      expect(updatedTask.repeatType, task.repeatType); // 変更なし
      expect(updatedTask.categoryId, task.categoryId); // 変更なし
      expect(updatedTask.reminderTime, task.reminderTime); // 変更なし
    });

    test('equality should work correctly', () {
      // 準備
      final task1 = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: '説明文',
        repeatTypeStr: 'daily',
      );

      final task2 = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: '説明文',
        repeatTypeStr: 'daily',
      );

      final task3 = Task.reconstitute(
        id: 'task-2', // 異なるID
        name: 'テストタスク',
        description: '説明文',
        repeatTypeStr: 'daily',
      );

      final task4 = Task.reconstitute(
        id: 'task-1',
        name: 'テストタスク',
        description: '異なる説明文', // 異なる説明
        repeatTypeStr: 'daily',
      );

      // 検証
      expect(task1 == task2, true);
      expect(task1 == task3, false);
      expect(task1 == task4, false);
      expect(task1.hashCode == task2.hashCode, true);
      expect(task1.hashCode == task3.hashCode, false);
      expect(task1.hashCode == task4.hashCode, false);
    });
  });
}
