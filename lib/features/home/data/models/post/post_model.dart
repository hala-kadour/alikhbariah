import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required String id,
    required String title,
    String? summary,
    String? location,
    required String content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'category_id') required String categoryID,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'is_breaking') @Default(false) bool? isBreaking,
    @JsonKey(name: 'is_featured') @Default(false) bool? isFeatured,
    @JsonKey(name: 'views_count') @Default(0) int? viewsCount,
    @Default("draft") String? status,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
