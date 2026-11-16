// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketTickerModel {

 String get market; double get tradePrice; double get signedChangeRate;// 0.0182 = 1.82%
 double get signedChangePrice; double get accTradePrice24h; double get highPrice; double get lowPrice;
/// Create a copy of MarketTickerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketTickerModelCopyWith<MarketTickerModel> get copyWith => _$MarketTickerModelCopyWithImpl<MarketTickerModel>(this as MarketTickerModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketTickerModel&&(identical(other.market, market) || other.market == market)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.signedChangeRate, signedChangeRate) || other.signedChangeRate == signedChangeRate)&&(identical(other.signedChangePrice, signedChangePrice) || other.signedChangePrice == signedChangePrice)&&(identical(other.accTradePrice24h, accTradePrice24h) || other.accTradePrice24h == accTradePrice24h)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,tradePrice,signedChangeRate,signedChangePrice,accTradePrice24h,highPrice,lowPrice);

@override
String toString() {
  return 'MarketTickerModel(market: $market, tradePrice: $tradePrice, signedChangeRate: $signedChangeRate, signedChangePrice: $signedChangePrice, accTradePrice24h: $accTradePrice24h, highPrice: $highPrice, lowPrice: $lowPrice)';
}


}

/// @nodoc
abstract mixin class $MarketTickerModelCopyWith<$Res>  {
  factory $MarketTickerModelCopyWith(MarketTickerModel value, $Res Function(MarketTickerModel) _then) = _$MarketTickerModelCopyWithImpl;
@useResult
$Res call({
 String market, double tradePrice, double signedChangeRate, double signedChangePrice, double accTradePrice24h, double highPrice, double lowPrice
});




}
/// @nodoc
class _$MarketTickerModelCopyWithImpl<$Res>
    implements $MarketTickerModelCopyWith<$Res> {
  _$MarketTickerModelCopyWithImpl(this._self, this._then);

  final MarketTickerModel _self;
  final $Res Function(MarketTickerModel) _then;

/// Create a copy of MarketTickerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? market = null,Object? tradePrice = null,Object? signedChangeRate = null,Object? signedChangePrice = null,Object? accTradePrice24h = null,Object? highPrice = null,Object? lowPrice = null,}) {
  return _then(_self.copyWith(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,signedChangeRate: null == signedChangeRate ? _self.signedChangeRate : signedChangeRate // ignore: cast_nullable_to_non_nullable
as double,signedChangePrice: null == signedChangePrice ? _self.signedChangePrice : signedChangePrice // ignore: cast_nullable_to_non_nullable
as double,accTradePrice24h: null == accTradePrice24h ? _self.accTradePrice24h : accTradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketTickerModel].
extension MarketTickerModelPatterns on MarketTickerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketTickerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketTickerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketTickerModel value)  $default,){
final _that = this;
switch (_that) {
case _MarketTickerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketTickerModel value)?  $default,){
final _that = this;
switch (_that) {
case _MarketTickerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double accTradePrice24h,  double highPrice,  double lowPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketTickerModel() when $default != null:
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.accTradePrice24h,_that.highPrice,_that.lowPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double accTradePrice24h,  double highPrice,  double lowPrice)  $default,) {final _that = this;
switch (_that) {
case _MarketTickerModel():
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.accTradePrice24h,_that.highPrice,_that.lowPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double accTradePrice24h,  double highPrice,  double lowPrice)?  $default,) {final _that = this;
switch (_that) {
case _MarketTickerModel() when $default != null:
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.accTradePrice24h,_that.highPrice,_that.lowPrice);case _:
  return null;

}
}

}

/// @nodoc


class _MarketTickerModel extends MarketTickerModel {
  const _MarketTickerModel({required this.market, required this.tradePrice, required this.signedChangeRate, required this.signedChangePrice, required this.accTradePrice24h, required this.highPrice, required this.lowPrice}): super._();
  

@override final  String market;
@override final  double tradePrice;
@override final  double signedChangeRate;
// 0.0182 = 1.82%
@override final  double signedChangePrice;
@override final  double accTradePrice24h;
@override final  double highPrice;
@override final  double lowPrice;

/// Create a copy of MarketTickerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketTickerModelCopyWith<_MarketTickerModel> get copyWith => __$MarketTickerModelCopyWithImpl<_MarketTickerModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketTickerModel&&(identical(other.market, market) || other.market == market)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.signedChangeRate, signedChangeRate) || other.signedChangeRate == signedChangeRate)&&(identical(other.signedChangePrice, signedChangePrice) || other.signedChangePrice == signedChangePrice)&&(identical(other.accTradePrice24h, accTradePrice24h) || other.accTradePrice24h == accTradePrice24h)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,tradePrice,signedChangeRate,signedChangePrice,accTradePrice24h,highPrice,lowPrice);

@override
String toString() {
  return 'MarketTickerModel(market: $market, tradePrice: $tradePrice, signedChangeRate: $signedChangeRate, signedChangePrice: $signedChangePrice, accTradePrice24h: $accTradePrice24h, highPrice: $highPrice, lowPrice: $lowPrice)';
}


}

/// @nodoc
abstract mixin class _$MarketTickerModelCopyWith<$Res> implements $MarketTickerModelCopyWith<$Res> {
  factory _$MarketTickerModelCopyWith(_MarketTickerModel value, $Res Function(_MarketTickerModel) _then) = __$MarketTickerModelCopyWithImpl;
@override @useResult
$Res call({
 String market, double tradePrice, double signedChangeRate, double signedChangePrice, double accTradePrice24h, double highPrice, double lowPrice
});




}
/// @nodoc
class __$MarketTickerModelCopyWithImpl<$Res>
    implements _$MarketTickerModelCopyWith<$Res> {
  __$MarketTickerModelCopyWithImpl(this._self, this._then);

  final _MarketTickerModel _self;
  final $Res Function(_MarketTickerModel) _then;

/// Create a copy of MarketTickerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? market = null,Object? tradePrice = null,Object? signedChangeRate = null,Object? signedChangePrice = null,Object? accTradePrice24h = null,Object? highPrice = null,Object? lowPrice = null,}) {
  return _then(_MarketTickerModel(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,signedChangeRate: null == signedChangeRate ? _self.signedChangeRate : signedChangeRate // ignore: cast_nullable_to_non_nullable
as double,signedChangePrice: null == signedChangePrice ? _self.signedChangePrice : signedChangePrice // ignore: cast_nullable_to_non_nullable
as double,accTradePrice24h: null == accTradePrice24h ? _self.accTradePrice24h : accTradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
