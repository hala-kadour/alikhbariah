// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breaking_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BreakingNewsModel {

 String get id; String get content;@JsonKey(name: 'is_urgent') bool get isUrgent;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of BreakingNewsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakingNewsModelCopyWith<BreakingNewsModel> get copyWith => _$BreakingNewsModelCopyWithImpl<BreakingNewsModel>(this as BreakingNewsModel, _$identity);

  /// Serializes this BreakingNewsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakingNewsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.isUrgent, isUrgent) || other.isUrgent == isUrgent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,isUrgent,isActive,createdAt);

@override
String toString() {
  return 'BreakingNewsModel(id: $id, content: $content, isUrgent: $isUrgent, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BreakingNewsModelCopyWith<$Res>  {
  factory $BreakingNewsModelCopyWith(BreakingNewsModel value, $Res Function(BreakingNewsModel) _then) = _$BreakingNewsModelCopyWithImpl;
@useResult
$Res call({
 String id, String content,@JsonKey(name: 'is_urgent') bool isUrgent,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$BreakingNewsModelCopyWithImpl<$Res>
    implements $BreakingNewsModelCopyWith<$Res> {
  _$BreakingNewsModelCopyWithImpl(this._self, this._then);

  final BreakingNewsModel _self;
  final $Res Function(BreakingNewsModel) _then;

/// Create a copy of BreakingNewsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? isUrgent = null,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isUrgent: null == isUrgent ? _self.isUrgent : isUrgent // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakingNewsModel].
extension BreakingNewsModelPatterns on BreakingNewsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakingNewsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakingNewsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakingNewsModel value)  $default,){
final _that = this;
switch (_that) {
case _BreakingNewsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakingNewsModel value)?  $default,){
final _that = this;
switch (_that) {
case _BreakingNewsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content, @JsonKey(name: 'is_urgent')  bool isUrgent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakingNewsModel() when $default != null:
return $default(_that.id,_that.content,_that.isUrgent,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content, @JsonKey(name: 'is_urgent')  bool isUrgent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BreakingNewsModel():
return $default(_that.id,_that.content,_that.isUrgent,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content, @JsonKey(name: 'is_urgent')  bool isUrgent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BreakingNewsModel() when $default != null:
return $default(_that.id,_that.content,_that.isUrgent,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakingNewsModel implements BreakingNewsModel {
  const _BreakingNewsModel({required this.id, required this.content, @JsonKey(name: 'is_urgent') this.isUrgent = false, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') this.createdAt});
  factory _BreakingNewsModel.fromJson(Map<String, dynamic> json) => _$BreakingNewsModelFromJson(json);

@override final  String id;
@override final  String content;
@override@JsonKey(name: 'is_urgent') final  bool isUrgent;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of BreakingNewsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakingNewsModelCopyWith<_BreakingNewsModel> get copyWith => __$BreakingNewsModelCopyWithImpl<_BreakingNewsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakingNewsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakingNewsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.isUrgent, isUrgent) || other.isUrgent == isUrgent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,isUrgent,isActive,createdAt);

@override
String toString() {
  return 'BreakingNewsModel(id: $id, content: $content, isUrgent: $isUrgent, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BreakingNewsModelCopyWith<$Res> implements $BreakingNewsModelCopyWith<$Res> {
  factory _$BreakingNewsModelCopyWith(_BreakingNewsModel value, $Res Function(_BreakingNewsModel) _then) = __$BreakingNewsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String content,@JsonKey(name: 'is_urgent') bool isUrgent,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$BreakingNewsModelCopyWithImpl<$Res>
    implements _$BreakingNewsModelCopyWith<$Res> {
  __$BreakingNewsModelCopyWithImpl(this._self, this._then);

  final _BreakingNewsModel _self;
  final $Res Function(_BreakingNewsModel) _then;

/// Create a copy of BreakingNewsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? isUrgent = null,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_BreakingNewsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isUrgent: null == isUrgent ? _self.isUrgent : isUrgent // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
