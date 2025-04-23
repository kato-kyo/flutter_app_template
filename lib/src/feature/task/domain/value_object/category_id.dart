/// カテゴリIDを表現する値オブジェクト
class CategoryId {
  final String value;

  const CategoryId._(this.value);

  /// 文字列からCategoryIdを生成
  factory CategoryId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('CategoryId cannot be empty');
    }
    return CategoryId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CategoryId && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'CategoryId($value)';
}
