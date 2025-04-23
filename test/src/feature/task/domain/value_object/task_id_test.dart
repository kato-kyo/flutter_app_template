import 'package:flutter_app_template/src/feature/task/domain/value_object/task_id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskId', () {
    test('Generate should create unique IDs', () {
      // 実行
      final id1 = TaskId.generate();
      final id2 = TaskId.generate();

      // 検証
      expect(id1.value.isNotEmpty, true);
      expect(id2.value.isNotEmpty, true);
      expect(id1 == id2, false); // 異なるIDが生成されること
    });

    test('fromString should create TaskId with given value', () {
      // 準備
      const idValue = 'test-id-123';

      // 実行
      final id = TaskId.fromString(idValue);

      // 検証
      expect(id.value, idValue);
    });

    test('fromString should throw ArgumentError for empty string', () {
      // 検証
      expect(() => TaskId.fromString(''), throwsArgumentError);
    });

    test('equality should work correctly', () {
      // 準備
      const idValue = 'test-id-123';
      final id1 = TaskId.fromString(idValue);
      final id2 = TaskId.fromString(idValue);
      final id3 = TaskId.fromString('different-id');

      // 検証
      expect(id1 == id2, true);
      expect(id1 == id3, false);
      expect(id1.hashCode == id2.hashCode, true);
      expect(id1.hashCode == id3.hashCode, false);
    });

    test('toString should return formatted string', () {
      // 準備
      const idValue = 'test-id-123';
      final id = TaskId.fromString(idValue);

      // 検証
      expect(id.toString(), 'TaskId($idValue)');
    });
  });
}
