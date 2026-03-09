// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

 String get id; String get title; String? get summary; String? get location; String get content;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'category_id') String get categoryID;@JsonKey(name: 'category_name') String get categoryName;@JsonKey(name: 'is_breaking') bool? get isBreaking;@JsonKey(name: 'is_featured') bool? get isFeatured;@JsonKey(name: 'views_count') int? get viewsCount; String? get status;@JsonKey(name: 'published_at') DateTime? get publishedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.location, location) || other.location == location)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.isBreaking, isBreaking) || other.isBreaking == isBreaking)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,location,content,imageUrl,categoryID,categoryName,isBreaking,isFeatured,viewsCount,status,publishedAt,createdAt);

@override
String toString() {
  return 'PostModel(id: $id, title: $title, summary: $summary, location: $location, content: $content, imageUrl: $imageUrl, categoryID: $categoryID, categoryName: $categoryName, isBreaking: $isBreaking, isFeatured: $isFeatured, viewsCount: $viewsCount, status: $status, publishedAt: $publishedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? summary, String? location, String content,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'category_id') String categoryID,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'is_breaking') bool? isBreaking,@JsonKey(name: 'is_featured') bool? isFeatured,@JsonKey(name: 'views_count') int? viewsCount, String? status,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = freezed,Object? location = freezed,Object? content = null,Object? imageUrl = freezed,Object? categoryID = null,Object? categoryName = null,Object? isBreaking = freezed,Object? isFeatured = freezed,Object? viewsCount = freezed,Object? status = freezed,Object? publishedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,isBreaking: freezed == isBreaking ? _self.isBreaking : isBreaking // ignore: cast_nullable_to_non_nullable
as bool?,isFeatured: freezed == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostModel].
extension PostModelPatterns on PostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostModel value)  $default,){
final _that = this;
switch (_that) {
case _PostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? summary,  String? location,  String content, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'category_id')  String categoryID, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'is_breaking')  bool? isBreaking, @JsonKey(name: 'is_featured')  bool? isFeatured, @JsonKey(name: 'views_count')  int? viewsCount,  String? status, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.location,_that.content,_that.imageUrl,_that.categoryID,_that.categoryName,_that.isBreaking,_that.isFeatured,_that.viewsCount,_that.status,_that.publishedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? summary,  String? location,  String content, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'category_id')  String categoryID, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'is_breaking')  bool? isBreaking, @JsonKey(name: 'is_featured')  bool? isFeatured, @JsonKey(name: 'views_count')  int? viewsCount,  String? status, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PostModel():
return $default(_that.id,_that.title,_that.summary,_that.location,_that.content,_that.imageUrl,_that.categoryID,_that.categoryName,_that.isBreaking,_that.isFeatured,_that.viewsCount,_that.status,_that.publishedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? summary,  String? location,  String content, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'category_id')  String categoryID, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'is_breaking')  bool? isBreaking, @JsonKey(name: 'is_featured')  bool? isFeatured, @JsonKey(name: 'views_count')  int? viewsCount,  String? status, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.location,_that.content,_that.imageUrl,_that.categoryID,_that.categoryName,_that.isBreaking,_that.isFeatured,_that.viewsCount,_that.status,_that.publishedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostModel implements PostModel {
  const _PostModel({required this.id, required this.title, this.summary, this.location, required this.content, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'category_id') required this.categoryID, @JsonKey(name: 'category_name') required this.categoryName, @JsonKey(name: 'is_breaking') this.isBreaking = false, @JsonKey(name: 'is_featured') this.isFeatured = false, @JsonKey(name: 'views_count') this.viewsCount = 0, this.status = "draft", @JsonKey(name: 'published_at') this.publishedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? summary;
@override final  String? location;
@override final  String content;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'category_id') final  String categoryID;
@override@JsonKey(name: 'category_name') final  String categoryName;
@override@JsonKey(name: 'is_breaking') final  bool? isBreaking;
@override@JsonKey(name: 'is_featured') final  bool? isFeatured;
@override@JsonKey(name: 'views_count') final  int? viewsCount;
@override@JsonKey() final  String? status;
@override@JsonKey(name: 'published_at') final  DateTime? publishedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.location, location) || other.location == location)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.isBreaking, isBreaking) || other.isBreaking == isBreaking)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,location,content,imageUrl,categoryID,categoryName,isBreaking,isFeatured,viewsCount,status,publishedAt,createdAt);

@override
String toString() {
  return 'PostModel(id: $id, title: $title, summary: $summary, location: $location, content: $content, imageUrl: $imageUrl, categoryID: $categoryID, categoryName: $categoryName, isBreaking: $isBreaking, isFeatured: $isFeatured, viewsCount: $viewsCount, status: $status, publishedAt: $publishedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? summary, String? location, String content,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'category_id') String categoryID,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'is_breaking') bool? isBreaking,@JsonKey(name: 'is_featured') bool? isFeatured,@JsonKey(name: 'views_count') int? viewsCount, String? status,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = freezed,Object? location = freezed,Object? content = null,Object? imageUrl = freezed,Object? categoryID = null,Object? categoryName = null,Object? isBreaking = freezed,Object? isFeatured = freezed,Object? viewsCount = freezed,Object? status = freezed,Object? publishedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_PostModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,isBreaking: freezed == isBreaking ? _self.isBreaking : isBreaking // ignore: cast_nullable_to_non_nullable
as bool?,isFeatured: freezed == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
