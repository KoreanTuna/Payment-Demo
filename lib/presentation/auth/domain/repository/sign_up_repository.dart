import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/presentation/auth/domain/entities/sign_up_form_entity.dart';

abstract interface class SignUpRepository {
  /// 이메일 인증 요청
  Future<Result<void>> requestEmailCertification({required String email});

  /// 이메일 인증 검증
  Future<Result<void>> certifyEmailCode({
    required String email,
    required String code,
  });

  /// 회원가입 요청
  Future<Result<void>> signUp({required SignUpFormEntity signUpFormEntity});
}
