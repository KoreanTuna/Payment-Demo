import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  Color? get baseBackgroundColor => ColorStyle.gray200;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
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
              style: const TextStyle().subTitle5,
            ),
            Text(
              '입국 후 바로 픽업할 수 있어요',
              style: const TextStyle().body2,
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// 카드 등록
        ///
        GestureDetector(
          onTap: () => context.pushNamed(RoutePath.cardScan),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: ColorStyle.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: ColorStyle.gray300,
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_rounded,
                  size: 40,
                  color: ColorStyle.coolGray500,
                ),
                const SizedBox(height: 8),
                Text(
                  '카드 등록하기',
                  style: const TextStyle().body2.copyWith(
                    color: ColorStyle.gray700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
