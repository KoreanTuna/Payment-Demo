// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_form_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpFormEntity _$SignUpFormEntityFromJson(Map<String, dynamic> json) =>
    _SignUpFormEntity(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      isAgreedToTerms: json['isAgreedToTerms'] as bool,
      isAgreedToPrivacyPolicy: json['isAgreedToPrivacyPolicy'] as bool,
    );

Map<String, dynamic> _$SignUpFormEntityToJson(_SignUpFormEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'isAgreedToTerms': instance.isAgreedToTerms,
      'isAgreedToPrivacyPolicy': instance.isAgreedToPrivacyPolicy,
    };
