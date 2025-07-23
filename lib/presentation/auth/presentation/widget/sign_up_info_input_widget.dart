import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/common/widget/custom_text_field.dart';
import 'package:payment_demo/common/widget/dialog/common_dialog.dart';
import 'package:payment_demo/common/widget/dialog/error_dialog.dart';
import 'package:payment_demo/core/extension/string.extension.dart';
import 'package:payment_demo/core/theme/text_style.dart';
import 'package:payment_demo/core/util/logger.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/presentation/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/presentation/auth/presentation/state/sign_up_event.dart';

class SignUpInfoInput extends HookConsumerWidget with SignUpEvent {
  const SignUpInfoInput({
    super.key,
    required this.signUpFormState,
  });

  final SignUpFormEntity signUpFormState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _InfoInputWidget(
          title: '이메일',
          hintText: '이메일을 입력하세요',
          isDisabled: signUpFormState.isEmailCertifiedRequested,
          onChanged: (email) {
            onChangedEmail(
              ref: ref,
              email: email,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CustomButton.border(
            label: '이메일 인증하기',

            onPressed: () async {
              final Result<void> requestResult =
                  await requestEmailCertification(
                    ref: ref,
                    email: signUpFormState.email,
                  );

              requestResult.when(
                ok: (_) {
                  // 이메일 인증 요청 성공 처리
                  logger.i('이메일 인증 요청 성공');
                  onChangeEmailCertifyRequest(
                    ref: ref,
                    isEmailCertifyRequested: true,
                  );
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CommonDialog(
                        title: '이메일 인증 요청 완료',
                        onPrimaryAction: context.pop,
                      );
                    },
                  );
                },
                error: (error) {
                  /// 이메일 인증 요청 실패 처리
                  showDialog(
                    context: context,
                    builder: (_) {
                      return ErrorDialog(
                        title: '오류 발생',
                        message: error.message,
                        onPrimaryAction: context.pop,
                      );
                    },
                  );
                },
              );
            },
            isEnabled:
                signUpFormState.email.isValidEmail() &&
                !signUpFormState.isEmailCertifiedRequested,
          ),
        ),
        if (signUpFormState.isEmailCertifiedRequested)
          _InfoInputWidget(
            title: '인증 코드',
            hintText: '이메일로 전송된 인증 코드를 입력하세요',
            onChanged: (code) {},
          )
        else
          Container(),

        _InfoInputWidget(
          title: '비밀번호',
          hintText: '비밀번호를 입력하세요',
          onChanged: (password) {
            onChangedPassword(
              ref: ref,
              password: password,
            );
          },
          isObscureText: true,
        ),
        _InfoInputWidget(
          title: '비밀번호 재입력',
          hintText: '비밀번호를 한 번 더 입력해주세요',
          onChanged: (passwordConfirmation) {
            onChangedPasswordConfirm(
              ref: ref,
              passwordConfirm: passwordConfirmation,
            );
          },
          isObscureText: true,
        ),
      ],
    );
  }
}

class _InfoInputWidget extends StatelessWidget {
  const _InfoInputWidget({
    required this.title,
    required this.hintText,
    required this.onChanged,
    this.isObscureText = false,
    this.isDisabled = false,
  });

  final String title;
  final String hintText;
  final void Function(String) onChanged;
  final bool isObscureText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle().subTitle6,
          ),
          CustomTextField(
            hintText: hintText,
            onChanged: onChanged,
            isObscureText: isObscureText,
            isDisabled: isDisabled,
          ),
        ],
      ),
    );
  }
}
