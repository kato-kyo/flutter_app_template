import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_id.freezed.dart';

/// カテゴリIDを表現する値オブジェクト
@freezed
class CategoryId with _$CategoryId {
  /// プライベートコンストラクタ
  const factory CategoryId({required String value}) = _CategoryId;

  /// 文字列からCategoryIdを生成
  factory CategoryId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('CategoryId cannot be empty');
    }
    return CategoryId(value: value);
  }

  /// カスタムメソッド用コンストラクタ
  const CategoryId._();

  @override
  String toString() => 'CategoryId($value)';
}
