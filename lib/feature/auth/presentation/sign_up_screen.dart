import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_appbar.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/feature/auth/domain/entities/sign_up_form_entity.dart';
import 'package:payment_demo/feature/auth/presentation/state/sign_up_event.dart';
import 'package:payment_demo/feature/auth/presentation/state/sign_up_state.dart';
import 'package:payment_demo/feature/auth/presentation/widget/sign_up_info_input_widget.dart';
import 'package:payment_demo/feature/auth/presentation/widget/sign_up_terms_agree_widget.dart';

class SignUpScreen extends BaseScreen with SignUpEvent, SignUpState {
  const SignUpScreen({super.key});

  @override
  bool get baseResizeToAvoidBottomInset => true;
  @override
  PreferredSizeWidget? renderAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppbar(
      title: '신규 계정 만들기',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: context.pop,
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    /// 회원가입 폼 상태 관리
    final SignUpFormEntity signUpFormState = getSignUpFormState(ref);

    useEffect(
      () {
        /// 스크롤이 위로 움직일때 키보드 해제
        scrollController.addListener(() {
          if (scrollController.position.pixels <= 0) {
            FocusScope.of(context).unfocus();
          }
        });

        return null;
      },
      [],
    );

    return Column(
      children: [
        Expanded(
          child: ListView(
            controller: scrollController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 이메일 / 비밀번호 / 비밀번호 재입력 입력 위젯
                  SignUpInfoInput(signUpFormState: signUpFormState),

                  /// 약관 동의 입력 위젯
                  SignUpTermsAgreeWidget(
                    currentSignUpFormState: signUpFormState,
                    onTermsChanged: ({required value}) => onChangeTermsAgree(
                      ref: ref,
                      isTermsAgree: value,
                    ),
                    onPrivacyPolicyChanged: ({required value}) =>
                        onChangePrivacyAgree(
                          ref: ref,
                          isPrivacyAgree: value,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomButton(
          label: '회원가입 완료',
          onPressed: () => context.goNamed(RoutePath.home),
          isEnabled: signUpFormState.isValid,
        ),
      ],
    );
  }
}
