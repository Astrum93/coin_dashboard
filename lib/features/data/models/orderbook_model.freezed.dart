// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orderbook_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderbookModel {

 List<Map<String, dynamic>> get orderbookUnits; double get totalAskSize; double get totalBidSize;
/// Create a copy of OrderbookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderbookModelCopyWith<OrderbookModel> get copyWith => _$OrderbookModelCopyWithImpl<OrderbookModel>(this as OrderbookModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderbookModel&&const DeepCollectionEquality().equals(other.orderbookUnits, orderbookUnits)&&(identical(other.totalAskSize, totalAskSize) || other.totalAskSize == totalAskSize)&&(identical(other.totalBidSize, totalBidSize) || other.totalBidSize == totalBidSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(orderbookUnits),totalAskSize,totalBidSize);

@override
String toString() {
  return 'OrderbookModel(orderbookUnits: $orderbookUnits, totalAskSize: $totalAskSize, totalBidSize: $totalBidSize)';
}


}

/// @nodoc
abstract mixin class $OrderbookModelCopyWith<$Res>  {
  factory $OrderbookModelCopyWith(OrderbookModel value, $Res Function(OrderbookModel) _then) = _$OrderbookModelCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> orderbookUnits, double totalAskSize, double totalBidSize
});




}
/// @nodoc
class _$OrderbookModelCopyWithImpl<$Res>
    implements $OrderbookModelCopyWith<$Res> {
  _$OrderbookModelCopyWithImpl(this._self, this._then);

  final OrderbookModel _self;
  final $Res Function(OrderbookModel) _then;

/// Create a copy of OrderbookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderbookUnits = null,Object? totalAskSize = null,Object? totalBidSize = null,}) {
  return _then(_self.copyWith(
orderbookUnits: null == orderbookUnits ? _self.orderbookUnits : orderbookUnits // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalAskSize: null == totalAskSize ? _self.totalAskSize : totalAskSize // ignore: cast_nullable_to_non_nullable
as double,totalBidSize: null == totalBidSize ? _self.totalBidSize : totalBidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderbookModel].
extension OrderbookModelPatterns on OrderbookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderbookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderbookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderbookModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderbookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderbookModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderbookModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> orderbookUnits,  double totalAskSize,  double totalBidSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderbookModel() when $default != null:
return $default(_that.orderbookUnits,_that.totalAskSize,_that.totalBidSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> orderbookUnits,  double totalAskSize,  double totalBidSize)  $default,) {final _that = this;
switch (_that) {
case _OrderbookModel():
return $default(_that.orderbookUnits,_that.totalAskSize,_that.totalBidSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> orderbookUnits,  double totalAskSize,  double totalBidSize)?  $default,) {final _that = this;
switch (_that) {
case _OrderbookModel() when $default != null:
return $default(_that.orderbookUnits,_that.totalAskSize,_that.totalBidSize);case _:
  return null;

}
}

}

/// @nodoc


class _OrderbookModel extends OrderbookModel {
  const _OrderbookModel({required final  List<Map<String, dynamic>> orderbookUnits, required this.totalAskSize, required this.totalBidSize}): _orderbookUnits = orderbookUnits,super._();
  

 final  List<Map<String, dynamic>> _orderbookUnits;
@override List<Map<String, dynamic>> get orderbookUnits {
  if (_orderbookUnits is EqualUnmodifiableListView) return _orderbookUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderbookUnits);
}

@override final  double totalAskSize;
@override final  double totalBidSize;

/// Create a copy of OrderbookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderbookModelCopyWith<_OrderbookModel> get copyWith => __$OrderbookModelCopyWithImpl<_OrderbookModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderbookModel&&const DeepCollectionEquality().equals(other._orderbookUnits, _orderbookUnits)&&(identical(other.totalAskSize, totalAskSize) || other.totalAskSize == totalAskSize)&&(identical(other.totalBidSize, totalBidSize) || other.totalBidSize == totalBidSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orderbookUnits),totalAskSize,totalBidSize);

@override
String toString() {
  return 'OrderbookModel(orderbookUnits: $orderbookUnits, totalAskSize: $totalAskSize, totalBidSize: $totalBidSize)';
}


}

/// @nodoc
abstract mixin class _$OrderbookModelCopyWith<$Res> implements $OrderbookModelCopyWith<$Res> {
  factory _$OrderbookModelCopyWith(_OrderbookModel value, $Res Function(_OrderbookModel) _then) = __$OrderbookModelCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> orderbookUnits, double totalAskSize, double totalBidSize
});




}
/// @nodoc
class __$OrderbookModelCopyWithImpl<$Res>
    implements _$OrderbookModelCopyWith<$Res> {
  __$OrderbookModelCopyWithImpl(this._self, this._then);

  final _OrderbookModel _self;
  final $Res Function(_OrderbookModel) _then;

/// Create a copy of OrderbookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderbookUnits = null,Object? totalAskSize = null,Object? totalBidSize = null,}) {
  return _then(_OrderbookModel(
orderbookUnits: null == orderbookUnits ? _self._orderbookUnits : orderbookUnits // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalAskSize: null == totalAskSize ? _self.totalAskSize : totalAskSize // ignore: cast_nullable_to_non_nullable
as double,totalBidSize: null == totalBidSize ? _self.totalBidSize : totalBidSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
