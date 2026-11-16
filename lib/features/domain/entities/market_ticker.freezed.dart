// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketTicker {

 String get market;// 예: 'KRW-BTC'
 String get symbol;// 예: 'BTC'
 String get koreanName;// 예: '비트코인'
 double get price; double get changeRate;// 전일 대비 퍼센트. 1.82 = 1.82%
 double get changePrice;// 전일 대비 금액 (부호 포함)
 double get tradePrice24h;// 24시간 누적 거래대금(원)
 double get highPrice; double get lowPrice;
/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketTickerCopyWith<MarketTicker> get copyWith => _$MarketTickerCopyWithImpl<MarketTicker>(this as MarketTicker, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketTicker&&(identical(other.market, market) || other.market == market)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.koreanName, koreanName) || other.koreanName == koreanName)&&(identical(other.price, price) || other.price == price)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.changePrice, changePrice) || other.changePrice == changePrice)&&(identical(other.tradePrice24h, tradePrice24h) || other.tradePrice24h == tradePrice24h)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,symbol,koreanName,price,changeRate,changePrice,tradePrice24h,highPrice,lowPrice);

@override
String toString() {
  return 'MarketTicker(market: $market, symbol: $symbol, koreanName: $koreanName, price: $price, changeRate: $changeRate, changePrice: $changePrice, tradePrice24h: $tradePrice24h, highPrice: $highPrice, lowPrice: $lowPrice)';
}


}

/// @nodoc
abstract mixin class $MarketTickerCopyWith<$Res>  {
  factory $MarketTickerCopyWith(MarketTicker value, $Res Function(MarketTicker) _then) = _$MarketTickerCopyWithImpl;
@useResult
$Res call({
 String market, String symbol, String koreanName, double price, double changeRate, double changePrice, double tradePrice24h, double highPrice, double lowPrice
});




}
/// @nodoc
class _$MarketTickerCopyWithImpl<$Res>
    implements $MarketTickerCopyWith<$Res> {
  _$MarketTickerCopyWithImpl(this._self, this._then);

  final MarketTicker _self;
  final $Res Function(MarketTicker) _then;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? market = null,Object? symbol = null,Object? koreanName = null,Object? price = null,Object? changeRate = null,Object? changePrice = null,Object? tradePrice24h = null,Object? highPrice = null,Object? lowPrice = null,}) {
  return _then(_self.copyWith(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,koreanName: null == koreanName ? _self.koreanName : koreanName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,changePrice: null == changePrice ? _self.changePrice : changePrice // ignore: cast_nullable_to_non_nullable
as double,tradePrice24h: null == tradePrice24h ? _self.tradePrice24h : tradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketTicker].
extension MarketTickerPatterns on MarketTicker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketTicker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketTicker value)  $default,){
final _that = this;
switch (_that) {
case _MarketTicker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketTicker value)?  $default,){
final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String market,  String symbol,  String koreanName,  double price,  double changeRate,  double changePrice,  double tradePrice24h,  double highPrice,  double lowPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that.market,_that.symbol,_that.koreanName,_that.price,_that.changeRate,_that.changePrice,_that.tradePrice24h,_that.highPrice,_that.lowPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String market,  String symbol,  String koreanName,  double price,  double changeRate,  double changePrice,  double tradePrice24h,  double highPrice,  double lowPrice)  $default,) {final _that = this;
switch (_that) {
case _MarketTicker():
return $default(_that.market,_that.symbol,_that.koreanName,_that.price,_that.changeRate,_that.changePrice,_that.tradePrice24h,_that.highPrice,_that.lowPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String market,  String symbol,  String koreanName,  double price,  double changeRate,  double changePrice,  double tradePrice24h,  double highPrice,  double lowPrice)?  $default,) {final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that.market,_that.symbol,_that.koreanName,_that.price,_that.changeRate,_that.changePrice,_that.tradePrice24h,_that.highPrice,_that.lowPrice);case _:
  return null;

}
}

}

/// @nodoc


class _MarketTicker implements MarketTicker {
  const _MarketTicker({required this.market, required this.symbol, required this.koreanName, required this.price, required this.changeRate, required this.changePrice, required this.tradePrice24h, required this.highPrice, required this.lowPrice});
  

@override final  String market;
// 예: 'KRW-BTC'
@override final  String symbol;
// 예: 'BTC'
@override final  String koreanName;
// 예: '비트코인'
@override final  double price;
@override final  double changeRate;
// 전일 대비 퍼센트. 1.82 = 1.82%
@override final  double changePrice;
// 전일 대비 금액 (부호 포함)
@override final  double tradePrice24h;
// 24시간 누적 거래대금(원)
@override final  double highPrice;
@override final  double lowPrice;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketTickerCopyWith<_MarketTicker> get copyWith => __$MarketTickerCopyWithImpl<_MarketTicker>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketTicker&&(identical(other.market, market) || other.market == market)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.koreanName, koreanName) || other.koreanName == koreanName)&&(identical(other.price, price) || other.price == price)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.changePrice, changePrice) || other.changePrice == changePrice)&&(identical(other.tradePrice24h, tradePrice24h) || other.tradePrice24h == tradePrice24h)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,symbol,koreanName,price,changeRate,changePrice,tradePrice24h,highPrice,lowPrice);

@override
String toString() {
  return 'MarketTicker(market: $market, symbol: $symbol, koreanName: $koreanName, price: $price, changeRate: $changeRate, changePrice: $changePrice, tradePrice24h: $tradePrice24h, highPrice: $highPrice, lowPrice: $lowPrice)';
}


}

/// @nodoc
abstract mixin class _$MarketTickerCopyWith<$Res> implements $MarketTickerCopyWith<$Res> {
  factory _$MarketTickerCopyWith(_MarketTicker value, $Res Function(_MarketTicker) _then) = __$MarketTickerCopyWithImpl;
@override @useResult
$Res call({
 String market, String symbol, String koreanName, double price, double changeRate, double changePrice, double tradePrice24h, double highPrice, double lowPrice
});




}
/// @nodoc
class __$MarketTickerCopyWithImpl<$Res>
    implements _$MarketTickerCopyWith<$Res> {
  __$MarketTickerCopyWithImpl(this._self, this._then);

  final _MarketTicker _self;
  final $Res Function(_MarketTicker) _then;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? market = null,Object? symbol = null,Object? koreanName = null,Object? price = null,Object? changeRate = null,Object? changePrice = null,Object? tradePrice24h = null,Object? highPrice = null,Object? lowPrice = null,}) {
  return _then(_MarketTicker(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,koreanName: null == koreanName ? _self.koreanName : koreanName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,changePrice: null == changePrice ? _self.changePrice : changePrice // ignore: cast_nullable_to_non_nullable
as double,tradePrice24h: null == tradePrice24h ? _self.tradePrice24h : tradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
