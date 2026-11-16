// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsArticleModel {

 String get title; String get description;// HTML 이 섞여 올 수 있다
 String get link; String get pubDate;// UTC 'yyyy-MM-dd HH:mm:ss'
 String? get thumbnail;
/// Create a copy of NewsArticleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticleModelCopyWith<NewsArticleModel> get copyWith => _$NewsArticleModelCopyWithImpl<NewsArticleModel>(this as NewsArticleModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticleModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.link, link) || other.link == link)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,link,pubDate,thumbnail);

@override
String toString() {
  return 'NewsArticleModel(title: $title, description: $description, link: $link, pubDate: $pubDate, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $NewsArticleModelCopyWith<$Res>  {
  factory $NewsArticleModelCopyWith(NewsArticleModel value, $Res Function(NewsArticleModel) _then) = _$NewsArticleModelCopyWithImpl;
@useResult
$Res call({
 String title, String description, String link, String pubDate, String? thumbnail
});




}
/// @nodoc
class _$NewsArticleModelCopyWithImpl<$Res>
    implements $NewsArticleModelCopyWith<$Res> {
  _$NewsArticleModelCopyWithImpl(this._self, this._then);

  final NewsArticleModel _self;
  final $Res Function(NewsArticleModel) _then;

/// Create a copy of NewsArticleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? link = null,Object? pubDate = null,Object? thumbnail = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsArticleModel].
extension NewsArticleModelPatterns on NewsArticleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsArticleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsArticleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsArticleModel value)  $default,){
final _that = this;
switch (_that) {
case _NewsArticleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsArticleModel value)?  $default,){
final _that = this;
switch (_that) {
case _NewsArticleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String link,  String pubDate,  String? thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsArticleModel() when $default != null:
return $default(_that.title,_that.description,_that.link,_that.pubDate,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String link,  String pubDate,  String? thumbnail)  $default,) {final _that = this;
switch (_that) {
case _NewsArticleModel():
return $default(_that.title,_that.description,_that.link,_that.pubDate,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String link,  String pubDate,  String? thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _NewsArticleModel() when $default != null:
return $default(_that.title,_that.description,_that.link,_that.pubDate,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc


class _NewsArticleModel extends NewsArticleModel {
  const _NewsArticleModel({required this.title, required this.description, required this.link, required this.pubDate, this.thumbnail}): super._();
  

@override final  String title;
@override final  String description;
// HTML 이 섞여 올 수 있다
@override final  String link;
@override final  String pubDate;
// UTC 'yyyy-MM-dd HH:mm:ss'
@override final  String? thumbnail;

/// Create a copy of NewsArticleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticleModelCopyWith<_NewsArticleModel> get copyWith => __$NewsArticleModelCopyWithImpl<_NewsArticleModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticleModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.link, link) || other.link == link)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,link,pubDate,thumbnail);

@override
String toString() {
  return 'NewsArticleModel(title: $title, description: $description, link: $link, pubDate: $pubDate, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$NewsArticleModelCopyWith<$Res> implements $NewsArticleModelCopyWith<$Res> {
  factory _$NewsArticleModelCopyWith(_NewsArticleModel value, $Res Function(_NewsArticleModel) _then) = __$NewsArticleModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String link, String pubDate, String? thumbnail
});




}
/// @nodoc
class __$NewsArticleModelCopyWithImpl<$Res>
    implements _$NewsArticleModelCopyWith<$Res> {
  __$NewsArticleModelCopyWithImpl(this._self, this._then);

  final _NewsArticleModel _self;
  final $Res Function(_NewsArticleModel) _then;

/// Create a copy of NewsArticleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? link = null,Object? pubDate = null,Object? thumbnail = freezed,}) {
  return _then(_NewsArticleModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
