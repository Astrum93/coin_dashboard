// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orderbook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderbookUnit {

 double get askPrice; double get askSize; double get bidPrice; double get bidSize;
/// Create a copy of OrderbookUnit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderbookUnitCopyWith<OrderbookUnit> get copyWith => _$OrderbookUnitCopyWithImpl<OrderbookUnit>(this as OrderbookUnit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderbookUnit&&(identical(other.askPrice, askPrice) || other.askPrice == askPrice)&&(identical(other.askSize, askSize) || other.askSize == askSize)&&(identical(other.bidPrice, bidPrice) || other.bidPrice == bidPrice)&&(identical(other.bidSize, bidSize) || other.bidSize == bidSize));
}


@override
int get hashCode => Object.hash(runtimeType,askPrice,askSize,bidPrice,bidSize);

@override
String toString() {
  return 'OrderbookUnit(askPrice: $askPrice, askSize: $askSize, bidPrice: $bidPrice, bidSize: $bidSize)';
}


}

/// @nodoc
abstract mixin class $OrderbookUnitCopyWith<$Res>  {
  factory $OrderbookUnitCopyWith(OrderbookUnit value, $Res Function(OrderbookUnit) _then) = _$OrderbookUnitCopyWithImpl;
@useResult
$Res call({
 double askPrice, double askSize, double bidPrice, double bidSize
});




}
/// @nodoc
class _$OrderbookUnitCopyWithImpl<$Res>
    implements $OrderbookUnitCopyWith<$Res> {
  _$OrderbookUnitCopyWithImpl(this._self, this._then);

  final OrderbookUnit _self;
  final $Res Function(OrderbookUnit) _then;

/// Create a copy of OrderbookUnit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? askPrice = null,Object? askSize = null,Object? bidPrice = null,Object? bidSize = null,}) {
  return _then(_self.copyWith(
askPrice: null == askPrice ? _self.askPrice : askPrice // ignore: cast_nullable_to_non_nullable
as double,askSize: null == askSize ? _self.askSize : askSize // ignore: cast_nullable_to_non_nullable
as double,bidPrice: null == bidPrice ? _self.bidPrice : bidPrice // ignore: cast_nullable_to_non_nullable
as double,bidSize: null == bidSize ? _self.bidSize : bidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderbookUnit].
extension OrderbookUnitPatterns on OrderbookUnit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderbookUnit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderbookUnit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderbookUnit value)  $default,){
final _that = this;
switch (_that) {
case _OrderbookUnit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderbookUnit value)?  $default,){
final _that = this;
switch (_that) {
case _OrderbookUnit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double askPrice,  double askSize,  double bidPrice,  double bidSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderbookUnit() when $default != null:
return $default(_that.askPrice,_that.askSize,_that.bidPrice,_that.bidSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double askPrice,  double askSize,  double bidPrice,  double bidSize)  $default,) {final _that = this;
switch (_that) {
case _OrderbookUnit():
return $default(_that.askPrice,_that.askSize,_that.bidPrice,_that.bidSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double askPrice,  double askSize,  double bidPrice,  double bidSize)?  $default,) {final _that = this;
switch (_that) {
case _OrderbookUnit() when $default != null:
return $default(_that.askPrice,_that.askSize,_that.bidPrice,_that.bidSize);case _:
  return null;

}
}

}

/// @nodoc


class _OrderbookUnit implements OrderbookUnit {
  const _OrderbookUnit({required this.askPrice, required this.askSize, required this.bidPrice, required this.bidSize});
  

@override final  double askPrice;
@override final  double askSize;
@override final  double bidPrice;
@override final  double bidSize;

/// Create a copy of OrderbookUnit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderbookUnitCopyWith<_OrderbookUnit> get copyWith => __$OrderbookUnitCopyWithImpl<_OrderbookUnit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderbookUnit&&(identical(other.askPrice, askPrice) || other.askPrice == askPrice)&&(identical(other.askSize, askSize) || other.askSize == askSize)&&(identical(other.bidPrice, bidPrice) || other.bidPrice == bidPrice)&&(identical(other.bidSize, bidSize) || other.bidSize == bidSize));
}


@override
int get hashCode => Object.hash(runtimeType,askPrice,askSize,bidPrice,bidSize);

@override
String toString() {
  return 'OrderbookUnit(askPrice: $askPrice, askSize: $askSize, bidPrice: $bidPrice, bidSize: $bidSize)';
}


}

/// @nodoc
abstract mixin class _$OrderbookUnitCopyWith<$Res> implements $OrderbookUnitCopyWith<$Res> {
  factory _$OrderbookUnitCopyWith(_OrderbookUnit value, $Res Function(_OrderbookUnit) _then) = __$OrderbookUnitCopyWithImpl;
@override @useResult
$Res call({
 double askPrice, double askSize, double bidPrice, double bidSize
});




}
/// @nodoc
class __$OrderbookUnitCopyWithImpl<$Res>
    implements _$OrderbookUnitCopyWith<$Res> {
  __$OrderbookUnitCopyWithImpl(this._self, this._then);

  final _OrderbookUnit _self;
  final $Res Function(_OrderbookUnit) _then;

/// Create a copy of OrderbookUnit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? askPrice = null,Object? askSize = null,Object? bidPrice = null,Object? bidSize = null,}) {
  return _then(_OrderbookUnit(
askPrice: null == askPrice ? _self.askPrice : askPrice // ignore: cast_nullable_to_non_nullable
as double,askSize: null == askSize ? _self.askSize : askSize // ignore: cast_nullable_to_non_nullable
as double,bidPrice: null == bidPrice ? _self.bidPrice : bidPrice // ignore: cast_nullable_to_non_nullable
as double,bidSize: null == bidSize ? _self.bidSize : bidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$Orderbook {

 List<OrderbookUnit> get units; double get totalAskSize;// 30호가 전체 매도 잔량
 double get totalBidSize;
/// Create a copy of Orderbook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderbookCopyWith<Orderbook> get copyWith => _$OrderbookCopyWithImpl<Orderbook>(this as Orderbook, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Orderbook&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.totalAskSize, totalAskSize) || other.totalAskSize == totalAskSize)&&(identical(other.totalBidSize, totalBidSize) || other.totalBidSize == totalBidSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(units),totalAskSize,totalBidSize);

@override
String toString() {
  return 'Orderbook(units: $units, totalAskSize: $totalAskSize, totalBidSize: $totalBidSize)';
}


}

/// @nodoc
abstract mixin class $OrderbookCopyWith<$Res>  {
  factory $OrderbookCopyWith(Orderbook value, $Res Function(Orderbook) _then) = _$OrderbookCopyWithImpl;
@useResult
$Res call({
 List<OrderbookUnit> units, double totalAskSize, double totalBidSize
});




}
/// @nodoc
class _$OrderbookCopyWithImpl<$Res>
    implements $OrderbookCopyWith<$Res> {
  _$OrderbookCopyWithImpl(this._self, this._then);

  final Orderbook _self;
  final $Res Function(Orderbook) _then;

/// Create a copy of Orderbook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? units = null,Object? totalAskSize = null,Object? totalBidSize = null,}) {
  return _then(_self.copyWith(
units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<OrderbookUnit>,totalAskSize: null == totalAskSize ? _self.totalAskSize : totalAskSize // ignore: cast_nullable_to_non_nullable
as double,totalBidSize: null == totalBidSize ? _self.totalBidSize : totalBidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Orderbook].
extension OrderbookPatterns on Orderbook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Orderbook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Orderbook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Orderbook value)  $default,){
final _that = this;
switch (_that) {
case _Orderbook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Orderbook value)?  $default,){
final _that = this;
switch (_that) {
case _Orderbook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderbookUnit> units,  double totalAskSize,  double totalBidSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Orderbook() when $default != null:
return $default(_that.units,_that.totalAskSize,_that.totalBidSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderbookUnit> units,  double totalAskSize,  double totalBidSize)  $default,) {final _that = this;
switch (_that) {
case _Orderbook():
return $default(_that.units,_that.totalAskSize,_that.totalBidSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderbookUnit> units,  double totalAskSize,  double totalBidSize)?  $default,) {final _that = this;
switch (_that) {
case _Orderbook() when $default != null:
return $default(_that.units,_that.totalAskSize,_that.totalBidSize);case _:
  return null;

}
}

}

/// @nodoc


class _Orderbook implements Orderbook {
  const _Orderbook({required final  List<OrderbookUnit> units, required this.totalAskSize, required this.totalBidSize}): _units = units;
  

 final  List<OrderbookUnit> _units;
@override List<OrderbookUnit> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  double totalAskSize;
// 30호가 전체 매도 잔량
@override final  double totalBidSize;

/// Create a copy of Orderbook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderbookCopyWith<_Orderbook> get copyWith => __$OrderbookCopyWithImpl<_Orderbook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Orderbook&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.totalAskSize, totalAskSize) || other.totalAskSize == totalAskSize)&&(identical(other.totalBidSize, totalBidSize) || other.totalBidSize == totalBidSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_units),totalAskSize,totalBidSize);

@override
String toString() {
  return 'Orderbook(units: $units, totalAskSize: $totalAskSize, totalBidSize: $totalBidSize)';
}


}

/// @nodoc
abstract mixin class _$OrderbookCopyWith<$Res> implements $OrderbookCopyWith<$Res> {
  factory _$OrderbookCopyWith(_Orderbook value, $Res Function(_Orderbook) _then) = __$OrderbookCopyWithImpl;
@override @useResult
$Res call({
 List<OrderbookUnit> units, double totalAskSize, double totalBidSize
});




}
/// @nodoc
class __$OrderbookCopyWithImpl<$Res>
    implements _$OrderbookCopyWith<$Res> {
  __$OrderbookCopyWithImpl(this._self, this._then);

  final _Orderbook _self;
  final $Res Function(_Orderbook) _then;

/// Create a copy of Orderbook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? units = null,Object? totalAskSize = null,Object? totalBidSize = null,}) {
  return _then(_Orderbook(
units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<OrderbookUnit>,totalAskSize: null == totalAskSize ? _self.totalAskSize : totalAskSize // ignore: cast_nullable_to_non_nullable
as double,totalBidSize: null == totalBidSize ? _self.totalBidSize : totalBidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
