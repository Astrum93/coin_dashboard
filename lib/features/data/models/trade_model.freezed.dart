// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TradeModel {

 int get sequentialId; int get timestamp;// ms
 double get tradePrice; double get tradeVolume; String get askBid;
/// Create a copy of TradeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeModelCopyWith<TradeModel> get copyWith => _$TradeModelCopyWithImpl<TradeModel>(this as TradeModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeModel&&(identical(other.sequentialId, sequentialId) || other.sequentialId == sequentialId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.tradeVolume, tradeVolume) || other.tradeVolume == tradeVolume)&&(identical(other.askBid, askBid) || other.askBid == askBid));
}


@override
int get hashCode => Object.hash(runtimeType,sequentialId,timestamp,tradePrice,tradeVolume,askBid);

@override
String toString() {
  return 'TradeModel(sequentialId: $sequentialId, timestamp: $timestamp, tradePrice: $tradePrice, tradeVolume: $tradeVolume, askBid: $askBid)';
}


}

/// @nodoc
abstract mixin class $TradeModelCopyWith<$Res>  {
  factory $TradeModelCopyWith(TradeModel value, $Res Function(TradeModel) _then) = _$TradeModelCopyWithImpl;
@useResult
$Res call({
 int sequentialId, int timestamp, double tradePrice, double tradeVolume, String askBid
});




}
/// @nodoc
class _$TradeModelCopyWithImpl<$Res>
    implements $TradeModelCopyWith<$Res> {
  _$TradeModelCopyWithImpl(this._self, this._then);

  final TradeModel _self;
  final $Res Function(TradeModel) _then;

/// Create a copy of TradeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequentialId = null,Object? timestamp = null,Object? tradePrice = null,Object? tradeVolume = null,Object? askBid = null,}) {
  return _then(_self.copyWith(
sequentialId: null == sequentialId ? _self.sequentialId : sequentialId // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,tradeVolume: null == tradeVolume ? _self.tradeVolume : tradeVolume // ignore: cast_nullable_to_non_nullable
as double,askBid: null == askBid ? _self.askBid : askBid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TradeModel].
extension TradeModelPatterns on TradeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TradeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TradeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TradeModel value)  $default,){
final _that = this;
switch (_that) {
case _TradeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TradeModel value)?  $default,){
final _that = this;
switch (_that) {
case _TradeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequentialId,  int timestamp,  double tradePrice,  double tradeVolume,  String askBid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TradeModel() when $default != null:
return $default(_that.sequentialId,_that.timestamp,_that.tradePrice,_that.tradeVolume,_that.askBid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequentialId,  int timestamp,  double tradePrice,  double tradeVolume,  String askBid)  $default,) {final _that = this;
switch (_that) {
case _TradeModel():
return $default(_that.sequentialId,_that.timestamp,_that.tradePrice,_that.tradeVolume,_that.askBid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequentialId,  int timestamp,  double tradePrice,  double tradeVolume,  String askBid)?  $default,) {final _that = this;
switch (_that) {
case _TradeModel() when $default != null:
return $default(_that.sequentialId,_that.timestamp,_that.tradePrice,_that.tradeVolume,_that.askBid);case _:
  return null;

}
}

}

/// @nodoc


class _TradeModel extends TradeModel {
  const _TradeModel({required this.sequentialId, required this.timestamp, required this.tradePrice, required this.tradeVolume, required this.askBid}): super._();
  

@override final  int sequentialId;
@override final  int timestamp;
// ms
@override final  double tradePrice;
@override final  double tradeVolume;
@override final  String askBid;

/// Create a copy of TradeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeModelCopyWith<_TradeModel> get copyWith => __$TradeModelCopyWithImpl<_TradeModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradeModel&&(identical(other.sequentialId, sequentialId) || other.sequentialId == sequentialId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tradePrice, tradePrice) || other.tradePrice == tradePrice)&&(identical(other.tradeVolume, tradeVolume) || other.tradeVolume == tradeVolume)&&(identical(other.askBid, askBid) || other.askBid == askBid));
}


@override
int get hashCode => Object.hash(runtimeType,sequentialId,timestamp,tradePrice,tradeVolume,askBid);

@override
String toString() {
  return 'TradeModel(sequentialId: $sequentialId, timestamp: $timestamp, tradePrice: $tradePrice, tradeVolume: $tradeVolume, askBid: $askBid)';
}


}

/// @nodoc
abstract mixin class _$TradeModelCopyWith<$Res> implements $TradeModelCopyWith<$Res> {
  factory _$TradeModelCopyWith(_TradeModel value, $Res Function(_TradeModel) _then) = __$TradeModelCopyWithImpl;
@override @useResult
$Res call({
 int sequentialId, int timestamp, double tradePrice, double tradeVolume, String askBid
});




}
/// @nodoc
class __$TradeModelCopyWithImpl<$Res>
    implements _$TradeModelCopyWith<$Res> {
  __$TradeModelCopyWithImpl(this._self, this._then);

  final _TradeModel _self;
  final $Res Function(_TradeModel) _then;

/// Create a copy of TradeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequentialId = null,Object? timestamp = null,Object? tradePrice = null,Object? tradeVolume = null,Object? askBid = null,}) {
  return _then(_TradeModel(
sequentialId: null == sequentialId ? _self.sequentialId : sequentialId // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,tradePrice: null == tradePrice ? _self.tradePrice : tradePrice // ignore: cast_nullable_to_non_nullable
as double,tradeVolume: null == tradeVolume ? _self.tradeVolume : tradeVolume // ignore: cast_nullable_to_non_nullable
as double,askBid: null == askBid ? _self.askBid : askBid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
