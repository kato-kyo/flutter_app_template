/// 操作の成功または失敗を表現するクラス
class Result<T> {
  final T? _value;
  final Exception? _error;
  final bool _isSuccess;

  const Result._({T? value, Exception? error, required bool isSuccess})
    : _value = value,
      _error = error,
      _isSuccess = isSuccess;

  /// 成功結果を作成
  factory Result.success(T value) => Result._(value: value, isSuccess: true);

  /// 失敗結果を作成
  factory Result.failure(Exception error) =>
      Result._(error: error, isSuccess: false);

  /// 操作が成功したかどうか
  bool get isSuccess => _isSuccess;

  /// 操作が失敗したかどうか
  bool get isFailure => !_isSuccess;

  /// 成功時の値を取得
  /// 失敗の場合はStateErrorがスローされます
  T get value {
    if (isSuccess) {
      return _value as T;
    }
    throw StateError('Cannot get value from a failure result');
  }

  /// 失敗時のエラーを取得
  /// 成功の場合はStateErrorがスローされます
  Exception get error {
    if (isFailure) {
      return _error!;
    }
    throw StateError('Cannot get error from a success result');
  }

  /// 成功時に関数fを実行し、新しいResultを返す
  Result<R> map<R>(R Function(T value) f) {
    if (isSuccess) {
      try {
        return Result.success(f(value));
      } catch (e) {
        return Result.failure(e is Exception ? e : Exception(e.toString()));
      }
    }
    return Result.failure(error);
  }

  /// 成功時にResultを返す関数fを実行し、その結果を返す
  Result<R> flatMap<R>(Result<R> Function(T value) f) {
    if (isSuccess) {
      try {
        return f(value);
      } catch (e) {
        return Result.failure(e is Exception ? e : Exception(e.toString()));
      }
    }
    return Result.failure(error);
  }

  /// 失敗時に関数fを実行し、新しいResultを返す
  Result<T> mapError(Exception Function(Exception error) f) {
    if (isFailure) {
      try {
        return Result.failure(f(error));
      } catch (e) {
        return Result.failure(e is Exception ? e : Exception(e.toString()));
      }
    }
    return Result.success(value);
  }

  /// 成功時に関数onSuccessを実行し、失敗時に関数onFailureを実行
  R when<R>(
    R Function(T value) onSuccess,
    R Function(Exception error) onFailure,
  ) {
    if (isSuccess) {
      return onSuccess(value);
    } else {
      return onFailure(error);
    }
  }
}

/// ドメインエラーを表現する例外クラス
class DomainError implements Exception {
  final String message;

  DomainError(this.message);

  @override
  String toString() => 'DomainError: $message';
}
