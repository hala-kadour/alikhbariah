import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
abstract class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String title,
    @JsonKey(name: 'youtube_video_id') required String youtubeVideoId,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name')
    String? categoryName, // سنحتاجه للعرض في الجداول
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
