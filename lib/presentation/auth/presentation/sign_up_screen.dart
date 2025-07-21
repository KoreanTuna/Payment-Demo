import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_appbar.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/presentation/auth/presentation/widget/info_input_widget.dart';

class SignUpScreen extends BaseScreen {
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
                  InfoInputWidget(
                    title: '이메일',
                    hintText: '이메일을 입력하세요',
                    onChanged: (value) {
                      // 이메일 입력 처리
                    },
                  ),
                  const SizedBox(height: 12),
                  const CustomButton(
                    label: '이메일 인증하기',
                    isEnabled: false,
                  ),
                  const SizedBox(height: 12),

                  InfoInputWidget(
                    title: '비밀번호',
                    hintText: '비밀번호를 입력하세요',
                    onChanged: (value) {
                      // 비밀번호 입력 처리
                    },
                    isObscureText: true,
                  ),
                  const SizedBox(height: 12),
                  InfoInputWidget(
                    title: '비밀번호 재입력',
                    hintText: '비밀번호를 한 번 더 입력해주세요',
                    onChanged: (value) {
                      // 비밀번호 입력 처리
                    },
                    isObscureText: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        const CustomButton(
          label: '회원가입 완료',
          isEnabled: false,
        ),
      ],
    );
  }
}
