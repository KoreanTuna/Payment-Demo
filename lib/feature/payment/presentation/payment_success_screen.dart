import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class PaymentSuccessScreen extends BaseScreen {
  final String? price;
  final String? card;

  const PaymentSuccessScreen({super.key, this.price, this.card});

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: ColorStyle.primary500,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            '결제가 성공적으로 완료되었습니다.',
            style: const TextStyle().title3.copyWith(color: ColorStyle.gray850),
          ),
          const SizedBox(height: 8),
          if (price != null)
            Text(
              '결제 금액: $price',
              style: const TextStyle().body2.copyWith(
                color: ColorStyle.gray850,
              ),
            ),
          if (card != null)
            Text(
              '카드 정보: $card',
              style: const TextStyle().body2.copyWith(
                color: ColorStyle.gray850,
              ),
            ),
          const SizedBox(height: 24),
          CustomButton.border(
            label: '홈으로 이동',
            onPressed: () {
              context.goNamed(RoutePath.home);
            },
          ),
        ],
      ),
    );
  }
}
