import 'package:injectable/injectable.dart';
import 'package:payment_demo/core/extension/string.extension.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/presentation/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/presentation/auth/domain/repository/sign_up_repository.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  @override
  Future<Result<void>> requestEmailCertification({
    required String email,
  }) async {
    /// 이메일 형식 검증
    if (email.isEmpty || !email.isValidEmail()) {
      return const Result.error(FormatException('이메일 형식이 올바르지 않습니다.'));
    }

    /// 이메일 인증 요청 시뮬레이션
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> signUp({required SignUpFormEntity signUpFormEntity}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> certifyEmailCode({
    required String email,
    required String code,
  }) async {
    /// 이메일 인증 코드 검증 시뮬레이션
    if (code.isEmpty || code.length < 6) {
      return const Result.error(FormatException('인증 코드가 올바르지 않습니다.'));
    }

    /// 인증 코드 검증 성공 시뮬레이션
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => const Result.ok(null),
    );
  }
}
