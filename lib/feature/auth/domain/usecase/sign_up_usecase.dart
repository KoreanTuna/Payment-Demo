import 'package:injectable/injectable.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/feature/auth/domain/repository/sign_up_repository.dart';

@singleton
class SignUpUsecase {
  SignUpUsecase(this._signUpRepository);

  final SignUpRepository _signUpRepository;

  /// 이메일 인증 요청
  Future<Result<void>> requestEmailCertification({
    required String email,
  }) async {
    return _signUpRepository.requestEmailCertification(email: email);
  }

  Future<Result<void>> certifyEmailCode({
    required String email,
    required String code,
  }) async {
    return _signUpRepository.certifyEmailCode(
      email: email,
      code: code,
    );
  }

  /// 회원가입 요청
  Future<Result<void>> signUp({
    required SignUpFormEntity signUpFormEntity,
  }) async {
    return _signUpRepository.signUp(signUpFormEntity: signUpFormEntity);
  }
}
