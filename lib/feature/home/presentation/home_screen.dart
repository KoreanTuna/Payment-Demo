import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/domain/entities/user_entity.dart';
import 'package:payment_demo/common/provider/state/user_state.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/card_widget.dart';
import 'package:payment_demo/common/widget/image_widget.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';
import 'package:payment_demo/core/constant/png_image_path.dart';
import 'package:payment_demo/feature/home/presentation/widget/card_register_widget.dart';

class HomeScreen extends BaseScreen with UserState {
  const HomeScreen({super.key});

  @override
  Color? get baseBackgroundColor => ColorStyle.gray200;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final UserEntity user = getUser(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 카드 예약
        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              '카드를 미리 예약하세요',
              style: const TextStyle().subTitle4,
            ),
            Text(
              '입국 후 바로 픽업할 수 있어요',
              style: const TextStyle().body1,
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (user.cards.isNotEmpty)
          const Card3D()
        else
          CardRegisterWidget(
            onTap: () => context.pushNamed(RoutePath.cardScan),
          ),

        const SizedBox(height: 12),

        const Row(
          spacing: 12,
          children: [
            _HomeMenuButton(
              label: '내 예약',
              imagePath: PngImagePath.payInteraction3d,
            ),
            _HomeMenuButton(
              label: '관광패스',
              imagePath: PngImagePath.wallet3d,
            ),
            _HomeMenuButton(
              label: '이용안내',
              imagePath: PngImagePath.cardHand3d,
            ),
          ],
        ),

        const SizedBox(height: 12),

        const _BenefitButton(),
      ],
    );
  }
}

class _HomeMenuButton extends StatelessWidget {
  const _HomeMenuButton({
    required this.label,
    required this.imagePath,
  });

  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: ColorStyle.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: ColorStyle.gray300,
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              PngImageWidget(
                imagePath: imagePath,
                width: 48,
                height: 48,
              ),
              Text(
                label,
                style: const TextStyle().body1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitButton extends StatelessWidget {
  const _BenefitButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: ColorStyle.gray300,
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '카드 혜택 정보 보기',
              style: const TextStyle().subTitle5,
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
