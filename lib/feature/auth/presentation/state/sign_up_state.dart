import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/feature/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/feature/auth/presentation/provider/sign_up_provider.dart';

mixin class SignUpState {
  SignUpFormEntity getSignUpFormState(WidgetRef ref) {
    return ref.watch(signUpProvider);
  }
}
