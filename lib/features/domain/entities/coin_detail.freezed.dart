// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinDetail {

 String get market;// 예: 'KRW-BTC'
 String get symbol;// 예: 'BTC'
 String get koreanName;// 예: '비트코인'
 String get englishName;// 예: 'Bitcoin'
 double get price; double get changeRate;// 전일 대비 퍼센트. 1.82 = 1.82%
 double get changePrice;// 전일 대비 금액 (부호 포함)
 double get prevClosingPrice; double get openingPrice; double get highPrice; double get lowPrice; double get tradeVolume24h;// 24시간 누적 거래량(코인 개수)
 double get tradePrice24h;// 24시간 누적 거래대금(원)
 double get highest52WeekPrice; double get lowest52WeekPrice;
/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailCopyWith<CoinDetail> get copyWith => _$CoinDetailCopyWithImpl<CoinDetail>(this as CoinDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetail&&(identical(other.market, market) || other.market == market)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.koreanName, koreanName) || other.koreanName == koreanName)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.price, price) || other.price == price)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.changePrice, changePrice) || other.changePrice == changePrice)&&(identical(other.prevClosingPrice, prevClosingPrice) || other.prevClosingPrice == prevClosingPrice)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.tradeVolume24h, tradeVolume24h) || other.tradeVolume24h == tradeVolume24h)&&(identical(other.tradePrice24h, tradePrice24h) || other.tradePrice24h == tradePrice24h)&&(identical(other.highest52WeekPrice, highest52WeekPrice) || other.highest52WeekPrice == highest52WeekPrice)&&(identical(other.lowest52WeekPrice, lowest52WeekPrice) || other.lowest52WeekPrice == lowest52WeekPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,symbol,koreanName,englishName,price,changeRate,changePrice,prevClosingPrice,openingPrice,highPrice,lowPrice,tradeVolume24h,tradePrice24h,highest52WeekPrice,lowest52WeekPrice);

@override
String toString() {
  return 'CoinDetail(market: $market, symbol: $symbol, koreanName: $koreanName, englishName: $englishName, price: $price, changeRate: $changeRate, changePrice: $changePrice, prevClosingPrice: $prevClosingPrice, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradeVolume24h: $tradeVolume24h, tradePrice24h: $tradePrice24h, highest52WeekPrice: $highest52WeekPrice, lowest52WeekPrice: $lowest52WeekPrice)';
}


}

/// @nodoc
abstract mixin class $CoinDetailCopyWith<$Res>  {
  factory $CoinDetailCopyWith(CoinDetail value, $Res Function(CoinDetail) _then) = _$CoinDetailCopyWithImpl;
@useResult
$Res call({
 String market, String symbol, String koreanName, String englishName, double price, double changeRate, double changePrice, double prevClosingPrice, double openingPrice, double highPrice, double lowPrice, double tradeVolume24h, double tradePrice24h, double highest52WeekPrice, double lowest52WeekPrice
});




}
/// @nodoc
class _$CoinDetailCopyWithImpl<$Res>
    implements $CoinDetailCopyWith<$Res> {
  _$CoinDetailCopyWithImpl(this._self, this._then);

  final CoinDetail _self;
  final $Res Function(CoinDetail) _then;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? market = null,Object? symbol = null,Object? koreanName = null,Object? englishName = null,Object? price = null,Object? changeRate = null,Object? changePrice = null,Object? prevClosingPrice = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? tradeVolume24h = null,Object? tradePrice24h = null,Object? highest52WeekPrice = null,Object? lowest52WeekPrice = null,}) {
  return _then(_self.copyWith(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,koreanName: null == koreanName ? _self.koreanName : koreanName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,changePrice: null == changePrice ? _self.changePrice : changePrice // ignore: cast_nullable_to_non_nullable
as double,prevClosingPrice: null == prevClosingPrice ? _self.prevClosingPrice : prevClosingPrice // ignore: cast_nullable_to_non_nullable
as double,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,tradeVolume24h: null == tradeVolume24h ? _self.tradeVolume24h : tradeVolume24h // ignore: cast_nullable_to_non_nullable
as double,tradePrice24h: null == tradePrice24h ? _self.tradePrice24h : tradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highest52WeekPrice: null == highest52WeekPrice ? _self.highest52WeekPrice : highest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,lowest52WeekPrice: null == lowest52WeekPrice ? _self.lowest52WeekPrice : lowest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinDetail].
extension CoinDetailPatterns on CoinDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetail value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String market,  String symbol,  String koreanName,  String englishName,  double price,  double changeRate,  double changePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double tradeVolume24h,  double tradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
return $default(_that.market,_that.symbol,_that.koreanName,_that.englishName,_that.price,_that.changeRate,_that.changePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradeVolume24h,_that.tradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String market,  String symbol,  String koreanName,  String englishName,  double price,  double changeRate,  double changePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double tradeVolume24h,  double tradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)  $default,) {final _that = this;
switch (_that) {
case _CoinDetail():
return $default(_that.market,_that.symbol,_that.koreanName,_that.englishName,_that.price,_that.changeRate,_that.changePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradeVolume24h,_that.tradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String market,  String symbol,  String koreanName,  String englishName,  double price,  double changeRate,  double changePrice,  double prevClosingPrice,  double openingPrice,  double highPrice,  double lowPrice,  double tradeVolume24h,  double tradePrice24h,  double highest52WeekPrice,  double lowest52WeekPrice)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
return $default(_that.market,_that.symbol,_that.koreanName,_that.englishName,_that.price,_that.changeRate,_that.changePrice,_that.prevClosingPrice,_that.openingPrice,_that.highPrice,_that.lowPrice,_that.tradeVolume24h,_that.tradePrice24h,_that.highest52WeekPrice,_that.lowest52WeekPrice);case _:
  return null;

}
}

}

/// @nodoc


class _CoinDetail implements CoinDetail {
  const _CoinDetail({required this.market, required this.symbol, required this.koreanName, required this.englishName, required this.price, required this.changeRate, required this.changePrice, required this.prevClosingPrice, required this.openingPrice, required this.highPrice, required this.lowPrice, required this.tradeVolume24h, required this.tradePrice24h, required this.highest52WeekPrice, required this.lowest52WeekPrice});
  

@override final  String market;
// 예: 'KRW-BTC'
@override final  String symbol;
// 예: 'BTC'
@override final  String koreanName;
// 예: '비트코인'
@override final  String englishName;
// 예: 'Bitcoin'
@override final  double price;
@override final  double changeRate;
// 전일 대비 퍼센트. 1.82 = 1.82%
@override final  double changePrice;
// 전일 대비 금액 (부호 포함)
@override final  double prevClosingPrice;
@override final  double openingPrice;
@override final  double highPrice;
@override final  double lowPrice;
@override final  double tradeVolume24h;
// 24시간 누적 거래량(코인 개수)
@override final  double tradePrice24h;
// 24시간 누적 거래대금(원)
@override final  double highest52WeekPrice;
@override final  double lowest52WeekPrice;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailCopyWith<_CoinDetail> get copyWith => __$CoinDetailCopyWithImpl<_CoinDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetail&&(identical(other.market, market) || other.market == market)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.koreanName, koreanName) || other.koreanName == koreanName)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.price, price) || other.price == price)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.changePrice, changePrice) || other.changePrice == changePrice)&&(identical(other.prevClosingPrice, prevClosingPrice) || other.prevClosingPrice == prevClosingPrice)&&(identical(other.openingPrice, openingPrice) || other.openingPrice == openingPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.tradeVolume24h, tradeVolume24h) || other.tradeVolume24h == tradeVolume24h)&&(identical(other.tradePrice24h, tradePrice24h) || other.tradePrice24h == tradePrice24h)&&(identical(other.highest52WeekPrice, highest52WeekPrice) || other.highest52WeekPrice == highest52WeekPrice)&&(identical(other.lowest52WeekPrice, lowest52WeekPrice) || other.lowest52WeekPrice == lowest52WeekPrice));
}


@override
int get hashCode => Object.hash(runtimeType,market,symbol,koreanName,englishName,price,changeRate,changePrice,prevClosingPrice,openingPrice,highPrice,lowPrice,tradeVolume24h,tradePrice24h,highest52WeekPrice,lowest52WeekPrice);

@override
String toString() {
  return 'CoinDetail(market: $market, symbol: $symbol, koreanName: $koreanName, englishName: $englishName, price: $price, changeRate: $changeRate, changePrice: $changePrice, prevClosingPrice: $prevClosingPrice, openingPrice: $openingPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradeVolume24h: $tradeVolume24h, tradePrice24h: $tradePrice24h, highest52WeekPrice: $highest52WeekPrice, lowest52WeekPrice: $lowest52WeekPrice)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailCopyWith<$Res> implements $CoinDetailCopyWith<$Res> {
  factory _$CoinDetailCopyWith(_CoinDetail value, $Res Function(_CoinDetail) _then) = __$CoinDetailCopyWithImpl;
@override @useResult
$Res call({
 String market, String symbol, String koreanName, String englishName, double price, double changeRate, double changePrice, double prevClosingPrice, double openingPrice, double highPrice, double lowPrice, double tradeVolume24h, double tradePrice24h, double highest52WeekPrice, double lowest52WeekPrice
});




}
/// @nodoc
class __$CoinDetailCopyWithImpl<$Res>
    implements _$CoinDetailCopyWith<$Res> {
  __$CoinDetailCopyWithImpl(this._self, this._then);

  final _CoinDetail _self;
  final $Res Function(_CoinDetail) _then;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? market = null,Object? symbol = null,Object? koreanName = null,Object? englishName = null,Object? price = null,Object? changeRate = null,Object? changePrice = null,Object? prevClosingPrice = null,Object? openingPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? tradeVolume24h = null,Object? tradePrice24h = null,Object? highest52WeekPrice = null,Object? lowest52WeekPrice = null,}) {
  return _then(_CoinDetail(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,koreanName: null == koreanName ? _self.koreanName : koreanName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,changePrice: null == changePrice ? _self.changePrice : changePrice // ignore: cast_nullable_to_non_nullable
as double,prevClosingPrice: null == prevClosingPrice ? _self.prevClosingPrice : prevClosingPrice // ignore: cast_nullable_to_non_nullable
as double,openingPrice: null == openingPrice ? _self.openingPrice : openingPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,tradeVolume24h: null == tradeVolume24h ? _self.tradeVolume24h : tradeVolume24h // ignore: cast_nullable_to_non_nullable
as double,tradePrice24h: null == tradePrice24h ? _self.tradePrice24h : tradePrice24h // ignore: cast_nullable_to_non_nullable
as double,highest52WeekPrice: null == highest52WeekPrice ? _self.highest52WeekPrice : highest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,lowest52WeekPrice: null == lowest52WeekPrice ? _self.lowest52WeekPrice : lowest52WeekPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
