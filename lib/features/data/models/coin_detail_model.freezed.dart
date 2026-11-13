// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinDetailModel {

 String get market; double get tradePrice; double get signedChangeRate;// 0.0182 = 1.82%
 double get signedChangePrice; double get prevClosingPrice; double get openingPrice; double get highPrice; double get lowPrice; double get accTradeVolume24h; double get accTradePrice24h; double get highest52WeekPrice; double get lowest52WeekPrice;
/// Create a copy of CoinDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailModelCopyWith<CoinDetailModel> get copyWith => _$CoinDetailModelCopyWithImpl<CoinDetailModel>(this as CoinDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetailModel&&(identical(other.market, market) || other.market == market)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.signedChangeRate, signedChangeRate) || other.signedChangeRate == signedChangeRate)&&(identical(other.signedChangePrice, signedChangePrice) || other.signedChangePrice == signedChangePrice)&&(identical(other.prevClosingPrice, prevClosingPrice) || other.prevClosingPrice == prevClosingPrice)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.accTradeVolume24h, accTradeVolume24h) || other.accTradeVolume24h == accTradeVolume24h)&&(identical(other.accTradePrice24h, accTradePrice24h) || other.accTradePrice24h == accTradePrice24h)&&(identical(other.highest52WeekPrice, highest52WeekPrice) || other.highest52WeekPrice == highest52WeekPrice)&&(identical(other.lowest52WeekPrice, lowest52WeekPrice) || other.lowest52WeekPrice == lowest52WeekPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,tradePrice,signedChangeRate,signedChangePrice,prevClosingPrice,openingPrice,highPrice,lowPrice,accTradeVolume24h,accTradePrice24h,highest52WeekPrice,lowest52WeekPrice);

@override
String toString() {
  return 'CoinDetailModel(market: $market, tradePrice: $tradePrice, signedChangeRate: $signedChangeRate, signedChangePrice: $signedChangePrice, prevClosingPrice: $prevClosingPrice, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, accTradeVolume24h: $accTradeVolume24h, accTradePrice24h: $accTradePrice24h, highest52WeekPrice: $highest52WeekPrice, lowest52WeekPrice: $lowest52WeekPrice)';
}


}

/// @nodoc
abstract mixin class $CoinDetailModelCopyWith<$Res>  {
  factory $CoinDetailModelCopyWith(CoinDetailModel value, $Res Function(CoinDetailModel) _then) = _$CoinDetailModelCopyWithImpl;
@useResult
$Res call({
 String market, double tradePrice, double signedChangeRate, double signedChangePrice, double prevClosingPrice, double openingPrice, double highPrice, double lowPrice, double accTradeVolume24h, double accTradePrice24h, double highest52WeekPrice, double lowest52WeekPrice
});




}
/// @nodoc
class _$CoinDetailModelCopyWithImpl<$Res>
    implements $CoinDetailModelCopyWith<$Res> {
  _$CoinDetailModelCopyWithImpl(this._self, this._then);

  final CoinDetailModel _self;
  final $Res Function(CoinDetailModel) _then;

/// Create a copy of CoinDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? market = null,Object? tradePrice = null,Object? signedChangeRate = null,Object? signedChangePrice = null,Object? prevClosingPrice = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accTradeVolume24h = null,Object? accTradePrice24h = null,Object? highest52WeekPrice = null,Object? lowest52WeekPrice = null,}) {
  return _then(_self.copyWith(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,signedChangeRate: null == signedChangeRate ? _self.signedChangeRate : signedChangeRate // ignore: cast_nullable_to_non_nullable
as double,signedChangePrice: null == signedChangePrice ? _self.signedChangePrice : signedChangePrice // ignore: cast_nullable_to_non_nullable
as double,prevClosingPrice: null == prevClosingPrice ? _self.prevClosingPrice : prevClosingPrice // ignore: cast_nullable_to_non_nullable
as double,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,accTradeVolume24h: null == accTradeVolume24h ? _self.accTradeVolume24h : accTradeVolume24h // ignore: cast_nullable_to_non_nullable
as double,accTradePrice24h: null == accTradePrice24h ? _self.accTradePrice24h : accTradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highest52WeekPrice: null == highest52WeekPrice ? _self.highest52WeekPrice : highest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,lowest52WeekPrice: null == lowest52WeekPrice ? _self.lowest52WeekPrice : lowest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinDetailModel].
extension CoinDetailModelPatterns on CoinDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double accTradeVolume24h,  double accTradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetailModel() when $default != null:
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.accTradeVolume24h,_that.accTradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double accTradeVolume24h,  double accTradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)  $default,) {final _that = this;
switch (_that) {
case _CoinDetailModel():
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.accTradeVolume24h,_that.accTradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String market,  double tradePrice,  double signedChangeRate,  double signedChangePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double accTradeVolume24h,  double accTradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetailModel() when $default != null:
return $default(_that.market,_that.tradePrice,_that.signedChangeRate,_that.signedChangePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.accTradeVolume24h,_that.accTradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
  return null;

}
}

}

/// @nodoc


class _CoinDetailModel extends CoinDetailModel {
  const _CoinDetailModel({required this.market, required this.tradePrice, required this.signedChangeRate, required this.signedChangePrice, required this.prevClosingPrice, required this.openingPrice, required this.highPrice, required this.lowPrice, required this.accTradeVolume24h, required this.accTradePrice24h, required this.highest52WeekPrice, required this.lowest52WeekPrice}): super._();
  

@override final  String market;
@override final  double tradePrice;
@override final  double signedChangeRate;
// 0.0182 = 1.82%
@override final  double signedChangePrice;
@override final  double prevClosingPrice;
@override final  double openingPrice;
@override final  double highPrice;
@override final  double lowPrice;
@override final  double accTradeVolume24h;
@override final  double accTradePrice24h;
@override final  double highest52WeekPrice;
@override final  double lowest52WeekPrice;

/// Create a copy of CoinDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailModelCopyWith<_CoinDetailModel> get copyWith => __$CoinDetailModelCopyWithImpl<_CoinDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetailModel&&(identical(other.market, market) || other.market == market)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.signedChangeRate, signedChangeRate) || other.signedChangeRate == signedChangeRate)&&(identical(other.signedChangePrice, signedChangePrice) || other.signedChangePrice == signedChangePrice)&&(identical(other.prevClosingPrice, prevClosingPrice) || other.prevClosingPrice == prevClosingPrice)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.accTradeVolume24h, accTradeVolume24h) || other.accTradeVolume24h == accTradeVolume24h)&&(identical(other.accTradePrice24h, accTradePrice24h) || other.accTradePrice24h == accTradePrice24h)&&(identical(other.highest52WeekPrice, highest52WeekPrice) || other.highest52WeekPrice == highest52WeekPrice)&&(identical(other.lowest52WeekPrice, lowest52WeekPrice) || other.lowest52WeekPrice == lowest52WeekPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,tradePrice,signedChangeRate,signedChangePrice,prevClosingPrice,openingPrice,highPrice,lowPrice,accTradeVolume24h,accTradePrice24h,highest52WeekPrice,lowest52WeekPrice);

@override
String toString() {
  return 'CoinDetailModel(market: $market, tradePrice: $tradePrice, signedChangeRate: $signedChangeRate, signedChangePrice: $signedChangePrice, prevClosingPrice: $prevClosingPrice, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, accTradeVolume24h: $accTradeVolume24h, accTradePrice24h: $accTradePrice24h, highest52WeekPrice: $highest52WeekPrice, lowest52WeekPrice: $lowest52WeekPrice)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailModelCopyWith<$Res> implements $CoinDetailModelCopyWith<$Res> {
  factory _$CoinDetailModelCopyWith(_CoinDetailModel value, $Res Function(_CoinDetailModel) _then) = __$CoinDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String market, double tradePrice, double signedChangeRate, double signedChangePrice, double prevClosingPrice, double openingPrice, double highPrice, double lowPrice, double accTradeVolume24h, double accTradePrice24h, double highest52WeekPrice, double lowest52WeekPrice
});




}
/// @nodoc
class __$CoinDetailModelCopyWithImpl<$Res>
    implements _$CoinDetailModelCopyWith<$Res> {
  __$CoinDetailModelCopyWithImpl(this._self, this._then);

  final _CoinDetailModel _self;
  final $Res Function(_CoinDetailModel) _then;

/// Create a copy of CoinDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? market = null,Object? tradePrice = null,Object? signedChangeRate = null,Object? signedChangePrice = null,Object? prevClosingPrice = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accTradeVolume24h = null,Object? accTradePrice24h = null,Object? highest52WeekPrice = null,Object? lowest52WeekPrice = null,}) {
  return _then(_CoinDetailModel(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,signedChangeRate: null == signedChangeRate ? _self.signedChangeRate : signedChangeRate // ignore: cast_nullable_to_non_nullable
as double,signedChangePrice: null == signedChangePrice ? _self.signedChangePrice : signedChangePrice // ignore: cast_nullable_to_non_nullable
as double,prevClosingPrice: null == prevClosingPrice ? _self.prevClosingPrice : prevClosingPrice // ignore: cast_nullable_to_non_nullable
as double,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,accTradeVolume24h: null == accTradeVolume24h ? _self.accTradeVolume24h : accTradeVolume24h // ignore: cast_nullable_to_non_nullable
as double,accTradePrice24h: null == accTradePrice24h ? _self.accTradePrice24h : accTradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highest52WeekPrice: null == highest52WeekPrice ? _self.highest52WeekPrice : highest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,lowest52WeekPrice: null == lowest52WeekPrice ? _self.lowest52WeekPrice : lowest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
