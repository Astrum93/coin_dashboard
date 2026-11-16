// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_links_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinLinksModel {

 String? get homepage; String? get twitterScreenName; String? get telegramChannel; String? get subredditUrl; String? get github; String? get whitepaper;
/// Create a copy of CoinLinksModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinLinksModelCopyWith<CoinLinksModel> get copyWith => _$CoinLinksModelCopyWithImpl<CoinLinksModel>(this as CoinLinksModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinLinksModel&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.twitterScreenName, twitterScreenName) || other.twitterScreenName == twitterScreenName)&&(identical(other.telegramChannel, telegramChannel) || other.telegramChannel == telegramChannel)&&(identical(other.subredditUrl, subredditUrl) || other.subredditUrl == subredditUrl)&&(identical(other.github, github) || other.github == github)&&(identical(other.whitepaper, whitepaper) || other.whitepaper == whitepaper));
}


@override
int get hashCode => Object.hash(runtimeType,homepage,twitterScreenName,telegramChannel,subredditUrl,github,whitepaper);

@override
String toString() {
  return 'CoinLinksModel(homepage: $homepage, twitterScreenName: $twitterScreenName, telegramChannel: $telegramChannel, subredditUrl: $subredditUrl, github: $github, whitepaper: $whitepaper)';
}


}

/// @nodoc
abstract mixin class $CoinLinksModelCopyWith<$Res>  {
  factory $CoinLinksModelCopyWith(CoinLinksModel value, $Res Function(CoinLinksModel) _then) = _$CoinLinksModelCopyWithImpl;
@useResult
$Res call({
 String? homepage, String? twitterScreenName, String? telegramChannel, String? subredditUrl, String? github, String? whitepaper
});




}
/// @nodoc
class _$CoinLinksModelCopyWithImpl<$Res>
    implements $CoinLinksModelCopyWith<$Res> {
  _$CoinLinksModelCopyWithImpl(this._self, this._then);

  final CoinLinksModel _self;
  final $Res Function(CoinLinksModel) _then;

/// Create a copy of CoinLinksModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homepage = freezed,Object? twitterScreenName = freezed,Object? telegramChannel = freezed,Object? subredditUrl = freezed,Object? github = freezed,Object? whitepaper = freezed,}) {
  return _then(_self.copyWith(
homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,twitterScreenName: freezed == twitterScreenName ? _self.twitterScreenName : twitterScreenName // ignore: cast_nullable_to_non_nullable
as String?,telegramChannel: freezed == telegramChannel ? _self.telegramChannel : telegramChannel // ignore: cast_nullable_to_non_nullable
as String?,subredditUrl: freezed == subredditUrl ? _self.subredditUrl : subredditUrl // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,whitepaper: freezed == whitepaper ? _self.whitepaper : whitepaper // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinLinksModel].
extension CoinLinksModelPatterns on CoinLinksModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinLinksModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinLinksModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinLinksModel value)  $default,){
final _that = this;
switch (_that) {
case _CoinLinksModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinLinksModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoinLinksModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? homepage,  String? twitterScreenName,  String? telegramChannel,  String? subredditUrl,  String? github,  String? whitepaper)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinLinksModel() when $default != null:
return $default(_that.homepage,_that.twitterScreenName,_that.telegramChannel,_that.subredditUrl,_that.github,_that.whitepaper);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? homepage,  String? twitterScreenName,  String? telegramChannel,  String? subredditUrl,  String? github,  String? whitepaper)  $default,) {final _that = this;
switch (_that) {
case _CoinLinksModel():
return $default(_that.homepage,_that.twitterScreenName,_that.telegramChannel,_that.subredditUrl,_that.github,_that.whitepaper);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? homepage,  String? twitterScreenName,  String? telegramChannel,  String? subredditUrl,  String? github,  String? whitepaper)?  $default,) {final _that = this;
switch (_that) {
case _CoinLinksModel() when $default != null:
return $default(_that.homepage,_that.twitterScreenName,_that.telegramChannel,_that.subredditUrl,_that.github,_that.whitepaper);case _:
  return null;

}
}

}

/// @nodoc


class _CoinLinksModel extends CoinLinksModel {
  const _CoinLinksModel({this.homepage, this.twitterScreenName, this.telegramChannel, this.subredditUrl, this.github, this.whitepaper}): super._();
  

@override final  String? homepage;
@override final  String? twitterScreenName;
@override final  String? telegramChannel;
@override final  String? subredditUrl;
@override final  String? github;
@override final  String? whitepaper;

/// Create a copy of CoinLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinLinksModelCopyWith<_CoinLinksModel> get copyWith => __$CoinLinksModelCopyWithImpl<_CoinLinksModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinLinksModel&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.twitterScreenName, twitterScreenName) || other.twitterScreenName == twitterScreenName)&&(identical(other.telegramChannel, telegramChannel) || other.telegramChannel == telegramChannel)&&(identical(other.subredditUrl, subredditUrl) || other.subredditUrl == subredditUrl)&&(identical(other.github, github) || other.github == github)&&(identical(other.whitepaper, whitepaper) || other.whitepaper == whitepaper));
}


@override
int get hashCode => Object.hash(runtimeType,homepage,twitterScreenName,telegramChannel,subredditUrl,github,whitepaper);

@override
String toString() {
  return 'CoinLinksModel(homepage: $homepage, twitterScreenName: $twitterScreenName, telegramChannel: $telegramChannel, subredditUrl: $subredditUrl, github: $github, whitepaper: $whitepaper)';
}


}

/// @nodoc
abstract mixin class _$CoinLinksModelCopyWith<$Res> implements $CoinLinksModelCopyWith<$Res> {
  factory _$CoinLinksModelCopyWith(_CoinLinksModel value, $Res Function(_CoinLinksModel) _then) = __$CoinLinksModelCopyWithImpl;
@override @useResult
$Res call({
 String? homepage, String? twitterScreenName, String? telegramChannel, String? subredditUrl, String? github, String? whitepaper
});




}
/// @nodoc
class __$CoinLinksModelCopyWithImpl<$Res>
    implements _$CoinLinksModelCopyWith<$Res> {
  __$CoinLinksModelCopyWithImpl(this._self, this._then);

  final _CoinLinksModel _self;
  final $Res Function(_CoinLinksModel) _then;

/// Create a copy of CoinLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homepage = freezed,Object? twitterScreenName = freezed,Object? telegramChannel = freezed,Object? subredditUrl = freezed,Object? github = freezed,Object? whitepaper = freezed,}) {
  return _then(_CoinLinksModel(
homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,twitterScreenName: freezed == twitterScreenName ? _self.twitterScreenName : twitterScreenName // ignore: cast_nullable_to_non_nullable
as String?,telegramChannel: freezed == telegramChannel ? _self.telegramChannel : telegramChannel // ignore: cast_nullable_to_non_nullable
as String?,subredditUrl: freezed == subredditUrl ? _self.subredditUrl : subredditUrl // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,whitepaper: freezed == whitepaper ? _self.whitepaper : whitepaper // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
