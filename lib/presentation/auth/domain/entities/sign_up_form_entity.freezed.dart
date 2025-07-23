// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpFormEntity {

 String get email; String get password; String get confirmPassword; bool get isAgreedToTerms; bool get isAgreedToPrivacyPolicy; bool get isEmailCertifiedRequested; bool get isEmailVerified;
/// Create a copy of SignUpFormEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpFormEntityCopyWith<SignUpFormEntity> get copyWith => _$SignUpFormEntityCopyWithImpl<SignUpFormEntity>(this as SignUpFormEntity, _$identity);

  /// Serializes this SignUpFormEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpFormEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isAgreedToTerms, isAgreedToTerms) || other.isAgreedToTerms == isAgreedToTerms)&&(identical(other.isAgreedToPrivacyPolicy, isAgreedToPrivacyPolicy) || other.isAgreedToPrivacyPolicy == isAgreedToPrivacyPolicy)&&(identical(other.isEmailCertifiedRequested, isEmailCertifiedRequested) || other.isEmailCertifiedRequested == isEmailCertifiedRequested)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,confirmPassword,isAgreedToTerms,isAgreedToPrivacyPolicy,isEmailCertifiedRequested,isEmailVerified);

@override
String toString() {
  return 'SignUpFormEntity(email: $email, password: $password, confirmPassword: $confirmPassword, isAgreedToTerms: $isAgreedToTerms, isAgreedToPrivacyPolicy: $isAgreedToPrivacyPolicy, isEmailCertifiedRequested: $isEmailCertifiedRequested, isEmailVerified: $isEmailVerified)';
}


}

/// @nodoc
abstract mixin class $SignUpFormEntityCopyWith<$Res>  {
  factory $SignUpFormEntityCopyWith(SignUpFormEntity value, $Res Function(SignUpFormEntity) _then) = _$SignUpFormEntityCopyWithImpl;
@useResult
$Res call({
 String email, String password, String confirmPassword, bool isAgreedToTerms, bool isAgreedToPrivacyPolicy, bool isEmailCertifiedRequested, bool isEmailVerified
});




}
/// @nodoc
class _$SignUpFormEntityCopyWithImpl<$Res>
    implements $SignUpFormEntityCopyWith<$Res> {
  _$SignUpFormEntityCopyWithImpl(this._self, this._then);

  final SignUpFormEntity _self;
  final $Res Function(SignUpFormEntity) _then;

/// Create a copy of SignUpFormEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isAgreedToTerms = null,Object? isAgreedToPrivacyPolicy = null,Object? isEmailCertifiedRequested = null,Object? isEmailVerified = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isAgreedToTerms: null == isAgreedToTerms ? _self.isAgreedToTerms : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,isAgreedToPrivacyPolicy: null == isAgreedToPrivacyPolicy ? _self.isAgreedToPrivacyPolicy : isAgreedToPrivacyPolicy // ignore: cast_nullable_to_non_nullable
as bool,isEmailCertifiedRequested: null == isEmailCertifiedRequested ? _self.isEmailCertifiedRequested : isEmailCertifiedRequested // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpFormEntity].
extension SignUpFormEntityPatterns on SignUpFormEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpFormEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpFormEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpFormEntity value)  $default,){
final _that = this;
switch (_that) {
case _SignUpFormEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpFormEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpFormEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String confirmPassword,  bool isAgreedToTerms,  bool isAgreedToPrivacyPolicy,  bool isEmailCertifiedRequested,  bool isEmailVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpFormEntity() when $default != null:
return $default(_that.email,_that.password,_that.confirmPassword,_that.isAgreedToTerms,_that.isAgreedToPrivacyPolicy,_that.isEmailCertifiedRequested,_that.isEmailVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String confirmPassword,  bool isAgreedToTerms,  bool isAgreedToPrivacyPolicy,  bool isEmailCertifiedRequested,  bool isEmailVerified)  $default,) {final _that = this;
switch (_that) {
case _SignUpFormEntity():
return $default(_that.email,_that.password,_that.confirmPassword,_that.isAgreedToTerms,_that.isAgreedToPrivacyPolicy,_that.isEmailCertifiedRequested,_that.isEmailVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String confirmPassword,  bool isAgreedToTerms,  bool isAgreedToPrivacyPolicy,  bool isEmailCertifiedRequested,  bool isEmailVerified)?  $default,) {final _that = this;
switch (_that) {
case _SignUpFormEntity() when $default != null:
return $default(_that.email,_that.password,_that.confirmPassword,_that.isAgreedToTerms,_that.isAgreedToPrivacyPolicy,_that.isEmailCertifiedRequested,_that.isEmailVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpFormEntity implements SignUpFormEntity {
  const _SignUpFormEntity({required this.email, required this.password, required this.confirmPassword, required this.isAgreedToTerms, required this.isAgreedToPrivacyPolicy, required this.isEmailCertifiedRequested, required this.isEmailVerified});
  factory _SignUpFormEntity.fromJson(Map<String, dynamic> json) => _$SignUpFormEntityFromJson(json);

@override final  String email;
@override final  String password;
@override final  String confirmPassword;
@override final  bool isAgreedToTerms;
@override final  bool isAgreedToPrivacyPolicy;
@override final  bool isEmailCertifiedRequested;
@override final  bool isEmailVerified;

/// Create a copy of SignUpFormEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpFormEntityCopyWith<_SignUpFormEntity> get copyWith => __$SignUpFormEntityCopyWithImpl<_SignUpFormEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpFormEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpFormEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isAgreedToTerms, isAgreedToTerms) || other.isAgreedToTerms == isAgreedToTerms)&&(identical(other.isAgreedToPrivacyPolicy, isAgreedToPrivacyPolicy) || other.isAgreedToPrivacyPolicy == isAgreedToPrivacyPolicy)&&(identical(other.isEmailCertifiedRequested, isEmailCertifiedRequested) || other.isEmailCertifiedRequested == isEmailCertifiedRequested)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,confirmPassword,isAgreedToTerms,isAgreedToPrivacyPolicy,isEmailCertifiedRequested,isEmailVerified);

@override
String toString() {
  return 'SignUpFormEntity(email: $email, password: $password, confirmPassword: $confirmPassword, isAgreedToTerms: $isAgreedToTerms, isAgreedToPrivacyPolicy: $isAgreedToPrivacyPolicy, isEmailCertifiedRequested: $isEmailCertifiedRequested, isEmailVerified: $isEmailVerified)';
}


}

/// @nodoc
abstract mixin class _$SignUpFormEntityCopyWith<$Res> implements $SignUpFormEntityCopyWith<$Res> {
  factory _$SignUpFormEntityCopyWith(_SignUpFormEntity value, $Res Function(_SignUpFormEntity) _then) = __$SignUpFormEntityCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String confirmPassword, bool isAgreedToTerms, bool isAgreedToPrivacyPolicy, bool isEmailCertifiedRequested, bool isEmailVerified
});




}
/// @nodoc
class __$SignUpFormEntityCopyWithImpl<$Res>
    implements _$SignUpFormEntityCopyWith<$Res> {
  __$SignUpFormEntityCopyWithImpl(this._self, this._then);

  final _SignUpFormEntity _self;
  final $Res Function(_SignUpFormEntity) _then;

/// Create a copy of SignUpFormEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isAgreedToTerms = null,Object? isAgreedToPrivacyPolicy = null,Object? isEmailCertifiedRequested = null,Object? isEmailVerified = null,}) {
  return _then(_SignUpFormEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isAgreedToTerms: null == isAgreedToTerms ? _self.isAgreedToTerms : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,isAgreedToPrivacyPolicy: null == isAgreedToPrivacyPolicy ? _self.isAgreedToPrivacyPolicy : isAgreedToPrivacyPolicy // ignore: cast_nullable_to_non_nullable
as bool,isEmailCertifiedRequested: null == isEmailCertifiedRequested ? _self.isEmailCertifiedRequested : isEmailCertifiedRequested // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
