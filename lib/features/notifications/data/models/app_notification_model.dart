import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification_model.freezed.dart';
part 'app_notification_model.g.dart';

@freezed
abstract class AppNotificationModel with _$AppNotificationModel {
  const factory AppNotificationModel({
    required String id,
    required String title,
    required String body,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'post_id') String? postId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppNotificationModel;

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);
}
