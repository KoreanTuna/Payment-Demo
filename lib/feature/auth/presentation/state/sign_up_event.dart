import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/auth/presentation/provider/sign_up_provider.dart';

mixin class SignUpEvent {
  /// 이메일 인증요청
  Future<Result<void>> requestEmailCertification({
    required WidgetRef ref,
    required String email,
  }) async {
    return ref.read(signUpProvider.notifier).requestEmailCertification(email);
  }

  /// 이메일 인증번호 확인
  Future<Result<void>> certifyEmailCode({
    required WidgetRef ref,
    required String email,
    required String code,
  }) async {
    return ref
        .read(signUpProvider.notifier)
        .certifyEmailCode(
          email: email,
          code: code,
        );
  }

  /// 이메일 입력 변경 이벤트
  void onChangedEmail({required WidgetRef ref, required String email}) {
    ref
        .read(signUpProvider.notifier)
        .setState(ref.read(signUpProvider).copyWith(email: email));
  }

  /// 비밀번호 입력 변경 이벤트
  void onChangedPassword({required WidgetRef ref, required String password}) {
    ref
        .read(signUpProvider.notifier)
        .setState(ref.read(signUpProvider).copyWith(password: password));
  }

  /// 비밀번호 확인 입력 변경 이벤트
  void onChangedPasswordConfirm({
    required WidgetRef ref,
    required String passwordConfirm,
  }) {
    ref
        .read(signUpProvider.notifier)
        .setState(
          ref.read(signUpProvider).copyWith(confirmPassword: passwordConfirm),
        );
  }

  /// 약관동의 입력 변경 이벤트
  void onChangeTermsAgree({
    required WidgetRef ref,
    required bool isTermsAgree,
  }) {
    ref
        .read(signUpProvider.notifier)
        .setState(
          ref.read(signUpProvider).copyWith(isAgreedToTerms: isTermsAgree),
        );
  }

  /// 개인정보 수집 및 이용 동의 입력 변경 이벤트
  void onChangePrivacyAgree({
    required WidgetRef ref,
    required bool isPrivacyAgree,
  }) {
    ref
        .read(signUpProvider.notifier)
        .setState(
          ref
              .read(signUpProvider)
              .copyWith(isAgreedToPrivacyPolicy: isPrivacyAgree),
        );
  }

  void onChangeEmailCertifyRequest({
    required WidgetRef ref,
    required bool isEmailCertifyRequested,
  }) {
    ref
        .read(signUpProvider.notifier)
        .setState(
          ref
              .read(signUpProvider)
              .copyWith(
                isEmailCertifiedRequested: isEmailCertifyRequested,
              ),
        );
  }

  void onChangeEmailCertifyCode({
    required WidgetRef ref,
    required bool isEmailCertifyCode,
  }) {
    ref
        .read(signUpProvider.notifier)
        .setState(
          ref
              .read(signUpProvider)
              .copyWith(isEmailVerified: isEmailCertifyCode),
        );
  }
}

mixin class SignUpInfoInputEvent {}
