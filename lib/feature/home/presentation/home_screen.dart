import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/domain/entities/user_entity.dart';
import 'package:payment_demo/common/provider/state/user_state.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/card_widget.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';
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
        const SizedBox(height: 16),

        if (user.cards.isNotEmpty)
          const Card3D()
        else
          CardRegisterWidget(
            onTap: () => context.pushNamed(RoutePath.cardScan),
          ),
      ],
    );
  }
}
