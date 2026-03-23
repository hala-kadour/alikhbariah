// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoCategoryModel {

 String get id; String get name;@JsonKey(name: 'image_url') String? get imageUrl; String get type;
/// Create a copy of VideoCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoCategoryModelCopyWith<VideoCategoryModel> get copyWith => _$VideoCategoryModelCopyWithImpl<VideoCategoryModel>(this as VideoCategoryModel, _$identity);

  /// Serializes this VideoCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,type);

@override
String toString() {
  return 'VideoCategoryModel(id: $id, name: $name, imageUrl: $imageUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class $VideoCategoryModelCopyWith<$Res>  {
  factory $VideoCategoryModelCopyWith(VideoCategoryModel value, $Res Function(VideoCategoryModel) _then) = _$VideoCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'image_url') String? imageUrl, String type
});




}
/// @nodoc
class _$VideoCategoryModelCopyWithImpl<$Res>
    implements $VideoCategoryModelCopyWith<$Res> {
  _$VideoCategoryModelCopyWithImpl(this._self, this._then);

  final VideoCategoryModel _self;
  final $Res Function(VideoCategoryModel) _then;

/// Create a copy of VideoCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoCategoryModel].
extension VideoCategoryModelPatterns on VideoCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'image_url')  String? imageUrl,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'image_url')  String? imageUrl,  String type)  $default,) {final _that = this;
switch (_that) {
case _VideoCategoryModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'image_url')  String? imageUrl,  String type)?  $default,) {final _that = this;
switch (_that) {
case _VideoCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoCategoryModel implements VideoCategoryModel {
  const _VideoCategoryModel({required this.id, required this.name, @JsonKey(name: 'image_url') this.imageUrl, required this.type});
  factory _VideoCategoryModel.fromJson(Map<String, dynamic> json) => _$VideoCategoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String type;

/// Create a copy of VideoCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoCategoryModelCopyWith<_VideoCategoryModel> get copyWith => __$VideoCategoryModelCopyWithImpl<_VideoCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,type);

@override
String toString() {
  return 'VideoCategoryModel(id: $id, name: $name, imageUrl: $imageUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class _$VideoCategoryModelCopyWith<$Res> implements $VideoCategoryModelCopyWith<$Res> {
  factory _$VideoCategoryModelCopyWith(_VideoCategoryModel value, $Res Function(_VideoCategoryModel) _then) = __$VideoCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'image_url') String? imageUrl, String type
});




}
/// @nodoc
class __$VideoCategoryModelCopyWithImpl<$Res>
    implements _$VideoCategoryModelCopyWith<$Res> {
  __$VideoCategoryModelCopyWithImpl(this._self, this._then);

  final _VideoCategoryModel _self;
  final $Res Function(_VideoCategoryModel) _then;

/// Create a copy of VideoCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? type = null,}) {
  return _then(_VideoCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
