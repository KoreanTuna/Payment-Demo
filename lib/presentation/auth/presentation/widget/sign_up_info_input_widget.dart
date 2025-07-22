import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/common/widget/custom_text_field.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class SignUpInfoInputWidget extends HookConsumerWidget {
  const SignUpInfoInputWidget({
    super.key,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedConfirmPassword,
    required this.onEmailCertificationPressed,
    required this.isEmailCertifiedEnabled,
  });

  final void Function(String value) onChangedEmail;
  final bool isEmailCertifiedEnabled;
  final VoidCallback onEmailCertificationPressed;

  final void Function(String value) onChangedPassword;
  final void Function(String value) onChangedConfirmPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _InfoInputWidget(
          title: '이메일',
          hintText: '이메일을 입력하세요',
          onChanged: onChangedEmail,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CustomButton.border(
            label: '이메일 인증하기',
            onPressed: onEmailCertificationPressed,
            isEnabled: isEmailCertifiedEnabled,
          ),
        ),

        _InfoInputWidget(
          title: '비밀번호',
          hintText: '비밀번호를 입력하세요',
          onChanged: onChangedPassword,
          isObscureText: true,
        ),
        _InfoInputWidget(
          title: '비밀번호 재입력',
          hintText: '비밀번호를 한 번 더 입력해주세요',
          onChanged: onChangedConfirmPassword,
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
  });

  final String title;
  final String hintText;
  final void Function(String) onChanged;
  final bool isObscureText;

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
          ),
        ],
      ),
    );
  }
}
