// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CandleModel {

 String get candleDateTimeKst;// 예: '2026-10-21T23:00:00'
 double get openingPrice; double get highPrice; double get lowPrice; double get tradePrice; double get candleAccTradeVolume;
/// Create a copy of CandleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandleModelCopyWith<CandleModel> get copyWith => _$CandleModelCopyWithImpl<CandleModel>(this as CandleModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandleModel&&(identical(other.candleDateTimeKst, candleDateTimeKst) || other.candleDateTimeKst == candleDateTimeKst)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.candleAccTradeVolume, candleAccTradeVolume) || other.candleAccTradeVolume == candleAccTradeVolume));
}


@override
int get hashCode => Object.hash(runtimeType,candleDateTimeKst,openingPrice,highPrice,lowPrice,tradePrice,candleAccTradeVolume);

@override
String toString() {
  return 'CandleModel(candleDateTimeKst: $candleDateTimeKst, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradePrice: $tradePrice, candleAccTradeVolume: $candleAccTradeVolume)';
}


}

/// @nodoc
abstract mixin class $CandleModelCopyWith<$Res>  {
  factory $CandleModelCopyWith(CandleModel value, $Res Function(CandleModel) _then) = _$CandleModelCopyWithImpl;
@useResult
$Res call({
 String candleDateTimeKst, double openingPrice, double highPrice, double lowPrice, double tradePrice, double candleAccTradeVolume
});




}
/// @nodoc
class _$CandleModelCopyWithImpl<$Res>
    implements $CandleModelCopyWith<$Res> {
  _$CandleModelCopyWithImpl(this._self, this._then);

  final CandleModel _self;
  final $Res Function(CandleModel) _then;

/// Create a copy of CandleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candleDateTimeKst = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? tradePrice = null,Object? candleAccTradeVolume = null,}) {
  return _then(_self.copyWith(
candleDateTimeKst: null == candleDateTimeKst ? _self.candleDateTimeKst : candleDateTimeKst // ignore: cast_nullable_to_non_nullable
as String,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,candleAccTradeVolume: null == candleAccTradeVolume ? _self.candleAccTradeVolume : candleAccTradeVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CandleModel].
extension CandleModelPatterns on CandleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandleModel value)  $default,){
final _that = this;
switch (_that) {
case _CandleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandleModel value)?  $default,){
final _that = this;
switch (_that) {
case _CandleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String candleDateTimeKst,  double openingPrice,  double highPrice,  double lowPrice,  double tradePrice,  double candleAccTradeVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandleModel() when $default != null:
return $default(_that.candleDateTimeKst,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradePrice,_that.candleAccTradeVolume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String candleDateTimeKst,  double openingPrice,  double highPrice,  double lowPrice,  double tradePrice,  double candleAccTradeVolume)  $default,) {final _that = this;
switch (_that) {
case _CandleModel():
return $default(_that.candleDateTimeKst,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradePrice,_that.candleAccTradeVolume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String candleDateTimeKst,  double openingPrice,  double highPrice,  double lowPrice,  double tradePrice,  double candleAccTradeVolume)?  $default,) {final _that = this;
switch (_that) {
case _CandleModel() when $default != null:
return $default(_that.candleDateTimeKst,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradePrice,_that.candleAccTradeVolume);case _:
  return null;

}
}

}

/// @nodoc


class _CandleModel extends CandleModel {
  const _CandleModel({required this.candleDateTimeKst, required this.openingPrice, required this.highPrice, required this.lowPrice, required this.tradePrice, required this.candleAccTradeVolume}): super._();
  

@override final  String candleDateTimeKst;
// 예: '2026-10-21T23:00:00'
@override final  double openingPrice;
@override final  double highPrice;
@override final  double lowPrice;
@override final  double tradePrice;
@override final  double candleAccTradeVolume;

/// Create a copy of CandleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandleModelCopyWith<_CandleModel> get copyWith => __$CandleModelCopyWithImpl<_CandleModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandleModel&&(identical(other.candleDateTimeKst, candleDateTimeKst) || other.candleDateTimeKst == candleDateTimeKst)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.candleAccTradeVolume, candleAccTradeVolume) || other.candleAccTradeVolume == candleAccTradeVolume));
}


@override
int get hashCode => Object.hash(runtimeType,candleDateTimeKst,openingPrice,highPrice,lowPrice,tradePrice,candleAccTradeVolume);

@override
String toString() {
  return 'CandleModel(candleDateTimeKst: $candleDateTimeKst, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradePrice: $tradePrice, candleAccTradeVolume: $candleAccTradeVolume)';
}


}

/// @nodoc
abstract mixin class _$CandleModelCopyWith<$Res> implements $CandleModelCopyWith<$Res> {
  factory _$CandleModelCopyWith(_CandleModel value, $Res Function(_CandleModel) _then) = __$CandleModelCopyWithImpl;
@override @useResult
$Res call({
 String candleDateTimeKst, double openingPrice, double highPrice, double lowPrice, double tradePrice, double candleAccTradeVolume
});




}
/// @nodoc
class __$CandleModelCopyWithImpl<$Res>
    implements _$CandleModelCopyWith<$Res> {
  __$CandleModelCopyWithImpl(this._self, this._then);

  final _CandleModel _self;
  final $Res Function(_CandleModel) _then;

/// Create a copy of CandleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candleDateTimeKst = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? tradePrice = null,Object? candleAccTradeVolume = null,}) {
  return _then(_CandleModel(
candleDateTimeKst: null == candleDateTimeKst ? _self.candleDateTimeKst : candleDateTimeKst // ignore: cast_nullable_to_non_nullable
as String,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,candleAccTradeVolume: null == candleAccTradeVolume ? _self.candleAccTradeVolume : candleAccTradeVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
