import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/check_box.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';
import 'package:payment_demo/feature/auth/domain/entities/sign_up_form_entity.dart';

class SignUpTermsAgreeWidget extends StatelessWidget {
  const SignUpTermsAgreeWidget({
    super.key,
    required this.currentSignUpFormState,
    required this.onTermsChanged,
    required this.onPrivacyPolicyChanged,
  });

  final SignUpFormEntity currentSignUpFormState;
  final void Function({required bool value}) onTermsChanged;
  final void Function({required bool value}) onPrivacyPolicyChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            '약관동의',
            style: const TextStyle().subTitle6,
          ),
        ),
        CustomCheckBox.labeld(
          label: '약관전체 동의(필수))',
          status:
              currentSignUpFormState.isAgreedToTerms &&
                  currentSignUpFormState.isAgreedToPrivacyPolicy
              ? CheckStatus.checked
              : CheckStatus.unchecked,
          onChanged: (value) {
            final isAgreed = value == CheckStatus.checked;
            onTermsChanged(value: isAgreed);
            onPrivacyPolicyChanged(value: isAgreed);
          },
        ),
        const Divider(
          height: 48,
          color: ColorStyle.gray200,
        ),
        CustomCheckBox.labeld(
          label: '이용약관 동의(필수))',
          status: currentSignUpFormState.isAgreedToTerms
              ? CheckStatus.checked
              : CheckStatus.unchecked,
          onChanged: (value) {
            final isAgreed = value == CheckStatus.checked;
            onTermsChanged(value: isAgreed);
          },
        ),
        CustomCheckBox.labeld(
          label: '개인정보 처리방침 동의',
          status: currentSignUpFormState.isAgreedToPrivacyPolicy
              ? CheckStatus.checked
              : CheckStatus.unchecked,

          onChanged: (value) {
            final isAgreed = value == CheckStatus.checked;
            onPrivacyPolicyChanged(value: isAgreed);
          },
        ),
      ],
    );
  }
}
