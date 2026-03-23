import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_category_model.freezed.dart';
part 'video_category_model.g.dart';

@freezed
abstract class VideoCategoryModel with _$VideoCategoryModel {
  const factory VideoCategoryModel({
    required String id,
    required String name,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String type, // 'program' or 'news_video'
  }) = _VideoCategoryModel;

  factory VideoCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryModelFromJson(json);
}
