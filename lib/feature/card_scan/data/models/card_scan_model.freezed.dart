// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardScanModel {

 String get cardNumber; String get cardHolderName; int get expirationYear; int get expirationMonth; int? get cvc;
/// Create a copy of CardScanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardScanModelCopyWith<CardScanModel> get copyWith => _$CardScanModelCopyWithImpl<CardScanModel>(this as CardScanModel, _$identity);

  /// Serializes this CardScanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardScanModel&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationYear, expirationYear) || other.expirationYear == expirationYear)&&(identical(other.expirationMonth, expirationMonth) || other.expirationMonth == expirationMonth)&&(identical(other.cvc, cvc) || other.cvc == cvc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNumber,cardHolderName,expirationYear,expirationMonth,cvc);

@override
String toString() {
  return 'CardScanModel(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationYear: $expirationYear, expirationMonth: $expirationMonth, cvc: $cvc)';
}


}

/// @nodoc
abstract mixin class $CardScanModelCopyWith<$Res>  {
  factory $CardScanModelCopyWith(CardScanModel value, $Res Function(CardScanModel) _then) = _$CardScanModelCopyWithImpl;
@useResult
$Res call({
 String cardNumber, String cardHolderName, int expirationYear, int expirationMonth, int? cvc
});




}
/// @nodoc
class _$CardScanModelCopyWithImpl<$Res>
    implements $CardScanModelCopyWith<$Res> {
  _$CardScanModelCopyWithImpl(this._self, this._then);

  final CardScanModel _self;
  final $Res Function(CardScanModel) _then;

/// Create a copy of CardScanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardNumber = null,Object? cardHolderName = null,Object? expirationYear = null,Object? expirationMonth = null,Object? cvc = freezed,}) {
  return _then(_self.copyWith(
cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationYear: null == expirationYear ? _self.expirationYear : expirationYear // ignore: cast_nullable_to_non_nullable
as int,expirationMonth: null == expirationMonth ? _self.expirationMonth : expirationMonth // ignore: cast_nullable_to_non_nullable
as int,cvc: freezed == cvc ? _self.cvc : cvc // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardScanModel].
extension CardScanModelPatterns on CardScanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardScanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardScanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardScanModel value)  $default,){
final _that = this;
switch (_that) {
case _CardScanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardScanModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardScanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardNumber,  String cardHolderName,  int expirationYear,  int expirationMonth,  int? cvc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardScanModel() when $default != null:
return $default(_that.cardNumber,_that.cardHolderName,_that.expirationYear,_that.expirationMonth,_that.cvc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardNumber,  String cardHolderName,  int expirationYear,  int expirationMonth,  int? cvc)  $default,) {final _that = this;
switch (_that) {
case _CardScanModel():
return $default(_that.cardNumber,_that.cardHolderName,_that.expirationYear,_that.expirationMonth,_that.cvc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardNumber,  String cardHolderName,  int expirationYear,  int expirationMonth,  int? cvc)?  $default,) {final _that = this;
switch (_that) {
case _CardScanModel() when $default != null:
return $default(_that.cardNumber,_that.cardHolderName,_that.expirationYear,_that.expirationMonth,_that.cvc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardScanModel implements CardScanModel {
  const _CardScanModel({required this.cardNumber, required this.cardHolderName, required this.expirationYear, required this.expirationMonth, this.cvc});
  factory _CardScanModel.fromJson(Map<String, dynamic> json) => _$CardScanModelFromJson(json);

@override final  String cardNumber;
@override final  String cardHolderName;
@override final  int expirationYear;
@override final  int expirationMonth;
@override final  int? cvc;

/// Create a copy of CardScanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardScanModelCopyWith<_CardScanModel> get copyWith => __$CardScanModelCopyWithImpl<_CardScanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardScanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardScanModel&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationYear, expirationYear) || other.expirationYear == expirationYear)&&(identical(other.expirationMonth, expirationMonth) || other.expirationMonth == expirationMonth)&&(identical(other.cvc, cvc) || other.cvc == cvc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNumber,cardHolderName,expirationYear,expirationMonth,cvc);

@override
String toString() {
  return 'CardScanModel(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationYear: $expirationYear, expirationMonth: $expirationMonth, cvc: $cvc)';
}


}

/// @nodoc
abstract mixin class _$CardScanModelCopyWith<$Res> implements $CardScanModelCopyWith<$Res> {
  factory _$CardScanModelCopyWith(_CardScanModel value, $Res Function(_CardScanModel) _then) = __$CardScanModelCopyWithImpl;
@override @useResult
$Res call({
 String cardNumber, String cardHolderName, int expirationYear, int expirationMonth, int? cvc
});




}
/// @nodoc
class __$CardScanModelCopyWithImpl<$Res>
    implements _$CardScanModelCopyWith<$Res> {
  __$CardScanModelCopyWithImpl(this._self, this._then);

  final _CardScanModel _self;
  final $Res Function(_CardScanModel) _then;

/// Create a copy of CardScanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardNumber = null,Object? cardHolderName = null,Object? expirationYear = null,Object? expirationMonth = null,Object? cvc = freezed,}) {
  return _then(_CardScanModel(
cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationYear: null == expirationYear ? _self.expirationYear : expirationYear // ignore: cast_nullable_to_non_nullable
as int,expirationMonth: null == expirationMonth ? _self.expirationMonth : expirationMonth // ignore: cast_nullable_to_non_nullable
as int,cvc: freezed == cvc ? _self.cvc : cvc // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
