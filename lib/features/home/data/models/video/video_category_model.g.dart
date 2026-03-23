// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoCategoryModel _$VideoCategoryModelFromJson(Map<String, dynamic> json) =>
    _VideoCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$VideoCategoryModelToJson(_VideoCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'type': instance.type,
    };
