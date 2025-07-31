import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/common/widget/animation/fade_in_out_text.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/image_widget.dart';
import 'package:payment_demo/common/widget/step_progress_indicator.dart';
import 'package:payment_demo/core/constant/png_image_path.dart';
import 'package:payment_demo/core/router/route_path.dart';

class EntryScreen extends BaseScreen {
  const EntryScreen({super.key});

  static final List<String> _titleList = [
    '각국 외화, 신용카드\n모바일 페이 충전',
    '이 모든 걸 앱에서\n쉽고 안전하게',
    '환전, 결제 대중교통 이용\n',
  ];

  static final List<String> _pageImagePath = [
    PngImagePath.cardHand3d,
    PngImagePath.payInteraction3d,
    PngImagePath.wallet3d,
  ];

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int> stepIndexState = useState(0);
    final ValueNotifier<int> titleIndexState = useState(0);
    final PageController pageController = usePageController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepProgressIndicator(
          currentStepIndex: stepIndexState.value,
          totalSteps: 3,
          onStepChanged: (index) {
            stepIndexState.value = index;
          },
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            FadeInOutText(
              key: ValueKey(titleIndexState.value),
              onFadeOutFinished: () => titleIndexState.value =
                  (titleIndexState.value + 1) % _titleList.length,
              text: _titleList[titleIndexState.value],
            ),
          ],
        ),

        Expanded(
          child: PageView.builder(
            itemCount: 3,
            controller: pageController,
            onPageChanged: (index) {
              stepIndexState.value = index;
            },
            itemBuilder: (context, index) {
              return Center(
                child: PngImageWidget(imagePath: _pageImagePath[index]),
              );
            },
          ),
        ),
        CustomButton(
          label: '새 계정 만들기',
          onPressed: () {
            context.goNamed(RoutePath.signUp);
          },
        ),
        CustomButton(
          applyBackgroundColor: false,
          label: '로그인',
          onPressed: () {
            context.goNamed(RoutePath.home);
          },
        ),
      ],
    );
  }
}
