/// タスクの繰り返しタイプを表す列挙型
enum RepeatType {
  /// 毎日繰り返し
  daily,

  /// 毎週繰り返し
  weekly;

  @override
  String toString() {
    switch (this) {
      case RepeatType.daily:
        return '毎日';
      case RepeatType.weekly:
        return '毎週';
    }
  }

  /// 文字列から繰り返しタイプを取得
  static RepeatType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'daily':
        return RepeatType.daily;
      case 'weekly':
        return RepeatType.weekly;
      default:
        throw ArgumentError('Invalid RepeatType: $value');
    }
  }

  /// 文字列表現を取得
  String toValue() {
    return name;
  }
}
