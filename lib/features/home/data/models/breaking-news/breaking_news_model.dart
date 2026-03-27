import 'package:freezed_annotation/freezed_annotation.dart';

part 'breaking_news_model.freezed.dart';
part 'breaking_news_model.g.dart';

@freezed
abstract class BreakingNewsModel with _$BreakingNewsModel {
  const factory BreakingNewsModel({
    required String id,
    required String content,
    @JsonKey(name: 'is_urgent') @Default(false) bool isUrgent,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _BreakingNewsModel;

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsModelFromJson(json);
}
