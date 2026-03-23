// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => _VideoModel(
  id: json['id'] as String,
  title: json['title'] as String,
  youtubeVideoId: json['youtube_video_id'] as String,
  categoryId: json['category_id'] as String,
  categoryName: json['category_name'] as String?,
  thumbnailUrl: json['thumbnail_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$VideoModelToJson(_VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'youtube_video_id': instance.youtubeVideoId,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'thumbnail_url': instance.thumbnailUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
