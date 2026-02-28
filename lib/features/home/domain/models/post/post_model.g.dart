// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String?,
  location: json['location'] as String?,
  content: json['content'] as String,
  imageUrl: json['image_url'] as String?,
  categoryID: json['category_id'] as String,
  categoryName: json['category_name'] as String,
  isBreaking: json['is_breaking'] as bool? ?? false,
  isFeatured: json['is_featured'] as bool? ?? false,
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  status: json['status'] as String? ?? "draft",
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'location': instance.location,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'category_id': instance.categoryID,
      'category_name': instance.categoryName,
      'is_breaking': instance.isBreaking,
      'is_featured': instance.isFeatured,
      'views_count': instance.viewsCount,
      'status': instance.status,
      'published_at': instance.publishedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
