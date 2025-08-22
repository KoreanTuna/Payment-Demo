import 'package:flutter/material.dart';
import 'package:payment_demo/core/constant/png_image_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class ExchangeGuideWidget extends StatelessWidget {
  const ExchangeGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text(
          '환율',
          style: const TextStyle().subTitle4.copyWith(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(PngImagePath.usaFlag),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(
          '1,350.91',
          style: const TextStyle().body2,
        ),
        const Icon(
          size: 16,
          Icons.arrow_forward_ios_rounded,
          color: ColorStyle.gray400,
        ),
      ],
    );
  }
}
