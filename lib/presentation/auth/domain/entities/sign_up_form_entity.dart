import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment_demo/core/extension/string.extension.dart';
part 'sign_up_form_entity.g.dart';
part 'sign_up_form_entity.freezed.dart';

/// 회원가입 중 입력되는 정보를 담는 엔티티입니다.
@freezed
abstract class SignUpFormEntity with _$SignUpFormEntity {
  const factory SignUpFormEntity({
    required String email,
    required String password,
    required String confirmPassword,
    required bool isAgreedToTerms,
    required bool isAgreedToPrivacyPolicy,
    required bool isEmailCertifiedRequested,
    required bool isEmailVerified,
  }) = _SignUpFormEntity;

  factory SignUpFormEntity.initial() {
    return const SignUpFormEntity(
      email: '',
      password: '',
      confirmPassword: '',
      isAgreedToTerms: false,
      isAgreedToPrivacyPolicy: false,
      isEmailCertifiedRequested: false,
      isEmailVerified: false,
    );
  }

  factory SignUpFormEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpFormEntityFromJson(json);
}

extension SignUpFormEntityExtension on SignUpFormEntity {
  /// 회원가입 폼의 유효성 검사
  bool get isValid {
    return email.isNotEmpty &&
        email.isValidEmail() &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        confirmPassword == password &&
        isAgreedToTerms &&
        isAgreedToPrivacyPolicy &&
        isEmailCertifiedRequested;
  }
}
