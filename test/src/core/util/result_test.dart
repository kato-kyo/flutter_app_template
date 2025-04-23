import 'package:flutter_app_template/src/core/util/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test('Success result should have correct value', () {
      // 準備
      final result = Result<String>.success('test');

      // 検証
      expect(result.isSuccess, true);
      expect(result.isFailure, false);
      expect(result.value, 'test');
    });

    test('Failure result should have correct error', () {
      // 準備
      final exception = Exception('error');
      final result = Result<String>.failure(exception);

      // 検証
      expect(result.isSuccess, false);
      expect(result.isFailure, true);
      expect(result.error, exception);
    });

    test('Success result should throw error when accessing error', () {
      // 準備
      final result = Result<String>.success('test');

      // 検証
      expect(() => result.error, throwsA(isA<StateError>()));
    });

    test('Failure result should throw error when accessing value', () {
      // 準備
      final result = Result<String>.failure(Exception('error'));

      // 検証
      expect(() => result.value, throwsA(isA<StateError>()));
    });

    test('map should transform success result', () {
      // 準備
      final result = Result<String>.success('test');

      // 実行
      final mapped = result.map((value) => value.length);

      // 検証
      expect(mapped.isSuccess, true);
      expect(mapped.value, 4);
    });

    test('map should propagate failure result', () {
      // 準備
      final exception = Exception('error');
      final result = Result<String>.failure(exception);

      // 実行
      final mapped = result.map((value) => value.length);

      // 検証
      expect(mapped.isFailure, true);
      expect(mapped.error, exception);
    });

    test('flatMap should transform success result with another result', () {
      // 準備
      final result = Result<String>.success('test');

      // 実行
      final flatMapped = result.flatMap(
        (value) => Result<int>.success(value.length),
      );

      // 検証
      expect(flatMapped.isSuccess, true);
      expect(flatMapped.value, 4);
    });

    test('flatMap should propagate failure result', () {
      // 準備
      final exception = Exception('error');
      final result = Result<String>.failure(exception);

      // 実行
      final flatMapped = result.flatMap(
        (value) => Result<int>.success(value.length),
      );

      // 検証
      expect(flatMapped.isFailure, true);
      expect(flatMapped.error, exception);
    });

    test('mapError should transform failure result', () {
      // 準備
      final result = Result<String>.failure(Exception('error'));

      // 実行
      final mapped = result.mapError(
        (error) => Exception('transformed: ${error.toString()}'),
      );

      // 検証
      expect(mapped.isFailure, true);
      expect(mapped.error.toString(), contains('transformed'));
    });

    test('mapError should not affect success result', () {
      // 準備
      final result = Result<String>.success('test');

      // 実行
      final mapped = result.mapError((error) => Exception('transformed'));

      // 検証
      expect(mapped.isSuccess, true);
      expect(mapped.value, 'test');
    });

    test('when should call onSuccess for success result', () {
      // 準備
      final result = Result<String>.success('test');
      String? calledWith;

      // 実行
      result.when(
        (value) => calledWith = value,
        (error) => fail('Should not call onFailure'),
      );

      // 検証
      expect(calledWith, 'test');
    });

    test('when should call onFailure for failure result', () {
      // 準備
      final exception = Exception('error');
      final result = Result<String>.failure(exception);
      Exception? calledWith;

      // 実行
      result.when(
        (value) => fail('Should not call onSuccess'),
        (error) => calledWith = error,
      );

      // 検証
      expect(calledWith, exception);
    });

    test('when should return correct value from callbacks', () {
      // 成功の場合
      final successResult = Result<String>.success('test');
      final successValue = successResult.when(
        (value) => value.length,
        (error) => -1,
      );
      expect(successValue, 4);

      // 失敗の場合
      final failureResult = Result<String>.failure(Exception('error'));
      final failureValue = failureResult.when(
        (value) => value.length,
        (error) => -1,
      );
      expect(failureValue, -1);
    });
  });

  group('DomainError', () {
    test('should store message correctly', () {
      // 準備と実行
      final error = DomainError('test error');

      // 検証
      expect(error.message, 'test error');
    });

    test('toString should include the message', () {
      // 準備と実行
      final error = DomainError('test error');

      // 検証
      expect(error.toString(), contains('test error'));
      expect(error.toString(), contains('DomainError'));
    });
  });
}
