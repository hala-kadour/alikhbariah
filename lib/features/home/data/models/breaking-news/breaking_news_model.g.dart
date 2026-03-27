// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breaking_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BreakingNewsModel _$BreakingNewsModelFromJson(Map<String, dynamic> json) =>
    _BreakingNewsModel(
      id: json['id'] as String,
      content: json['content'] as String,
      isUrgent: json['is_urgent'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BreakingNewsModelToJson(_BreakingNewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'is_urgent': instance.isUrgent,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
    };
