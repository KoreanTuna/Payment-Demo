import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/environment/getit.dart';
import 'package:payment_demo/feature/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/feature/auth/domain/usecase/sign_up_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  SignUpFormEntity build() {
    return SignUpFormEntity.initial();
  }

  void setState(SignUpFormEntity signUpFormEntity) => state = signUpFormEntity;

  Future<Result<void>> requestEmailCertification(
    String email, {
    SignUpUsecase? signUpUsecase,
  }) async {
    signUpUsecase ??= locator<SignUpUsecase>();

    final Result<void> result = await signUpUsecase.requestEmailCertification(
      email: email,
    );
    return result;
  }

  Future<Result<void>> certifyEmailCode({
    required String email,
    required String code,
    SignUpUsecase? signUpUsecase,
  }) async {
    signUpUsecase ??= locator<SignUpUsecase>();

    final Result<void> result = await signUpUsecase.certifyEmailCode(
      email: email,
      code: code,
    );
    return result;
  }
}
