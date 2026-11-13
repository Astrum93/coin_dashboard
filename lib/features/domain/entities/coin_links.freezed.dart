// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinLink {

 CoinLinkType get type; String get url;
/// Create a copy of CoinLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinLinkCopyWith<CoinLink> get copyWith => _$CoinLinkCopyWithImpl<CoinLink>(this as CoinLink, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinLink&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'CoinLink(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class $CoinLinkCopyWith<$Res>  {
  factory $CoinLinkCopyWith(CoinLink value, $Res Function(CoinLink) _then) = _$CoinLinkCopyWithImpl;
@useResult
$Res call({
 CoinLinkType type, String url
});




}
/// @nodoc
class _$CoinLinkCopyWithImpl<$Res>
    implements $CoinLinkCopyWith<$Res> {
  _$CoinLinkCopyWithImpl(this._self, this._then);

  final CoinLink _self;
  final $Res Function(CoinLink) _then;

/// Create a copy of CoinLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? url = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CoinLinkType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinLink].
extension CoinLinkPatterns on CoinLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinLink value)  $default,){
final _that = this;
switch (_that) {
case _CoinLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinLink value)?  $default,){
final _that = this;
switch (_that) {
case _CoinLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CoinLinkType type,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinLink() when $default != null:
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CoinLinkType type,  String url)  $default,) {final _that = this;
switch (_that) {
case _CoinLink():
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CoinLinkType type,  String url)?  $default,) {final _that = this;
switch (_that) {
case _CoinLink() when $default != null:
return $default(_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _CoinLink implements CoinLink {
  const _CoinLink({required this.type, required this.url});
  

@override final  CoinLinkType type;
@override final  String url;

/// Create a copy of CoinLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinLinkCopyWith<_CoinLink> get copyWith => __$CoinLinkCopyWithImpl<_CoinLink>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinLink&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'CoinLink(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CoinLinkCopyWith<$Res> implements $CoinLinkCopyWith<$Res> {
  factory _$CoinLinkCopyWith(_CoinLink value, $Res Function(_CoinLink) _then) = __$CoinLinkCopyWithImpl;
@override @useResult
$Res call({
 CoinLinkType type, String url
});




}
/// @nodoc
class __$CoinLinkCopyWithImpl<$Res>
    implements _$CoinLinkCopyWith<$Res> {
  __$CoinLinkCopyWithImpl(this._self, this._then);

  final _CoinLink _self;
  final $Res Function(_CoinLink) _then;

/// Create a copy of CoinLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? url = null,}) {
  return _then(_CoinLink(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CoinLinkType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
