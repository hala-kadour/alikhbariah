// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotificationModel {

 String get id; String get title; String get body;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'post_id') String? get postId;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationModelCopyWith<AppNotificationModel> get copyWith => _$AppNotificationModelCopyWithImpl<AppNotificationModel>(this as AppNotificationModel, _$identity);

  /// Serializes this AppNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,imageUrl,postId,createdAt);

@override
String toString() {
  return 'AppNotificationModel(id: $id, title: $title, body: $body, imageUrl: $imageUrl, postId: $postId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppNotificationModelCopyWith<$Res>  {
  factory $AppNotificationModelCopyWith(AppNotificationModel value, $Res Function(AppNotificationModel) _then) = _$AppNotificationModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'post_id') String? postId,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$AppNotificationModelCopyWithImpl<$Res>
    implements $AppNotificationModelCopyWith<$Res> {
  _$AppNotificationModelCopyWithImpl(this._self, this._then);

  final AppNotificationModel _self;
  final $Res Function(AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? postId = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotificationModel].
extension AppNotificationModelPatterns on AppNotificationModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'post_id')  String? postId, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.postId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'post_id')  String? postId, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel():
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.postId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'post_id')  String? postId, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.imageUrl,_that.postId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotificationModel implements AppNotificationModel {
  const _AppNotificationModel({required this.id, required this.title, required this.body, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'post_id') this.postId, @JsonKey(name: 'created_at') this.createdAt});
  factory _AppNotificationModel.fromJson(Map<String, dynamic> json) => _$AppNotificationModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'post_id') final  String? postId;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationModelCopyWith<_AppNotificationModel> get copyWith => __$AppNotificationModelCopyWithImpl<_AppNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,imageUrl,postId,createdAt);

@override
String toString() {
  return 'AppNotificationModel(id: $id, title: $title, body: $body, imageUrl: $imageUrl, postId: $postId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationModelCopyWith<$Res> implements $AppNotificationModelCopyWith<$Res> {
  factory _$AppNotificationModelCopyWith(_AppNotificationModel value, $Res Function(_AppNotificationModel) _then) = __$AppNotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'post_id') String? postId,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$AppNotificationModelCopyWithImpl<$Res>
    implements _$AppNotificationModelCopyWith<$Res> {
  __$AppNotificationModelCopyWithImpl(this._self, this._then);

  final _AppNotificationModel _self;
  final $Res Function(_AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? postId = freezed,Object? createdAt = freezed,}) {
  return _then(_AppNotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
