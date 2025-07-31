import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/animation/fade_in_out_image.dart';
import 'package:payment_demo/core/constant/png_image_path.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CardReservationWidget extends StatelessWidget {
  const CardReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        FadeInOutImage(
          imagePathList: const [
            PngImagePath.bombPhone3d,
            PngImagePath.gift3d,
            PngImagePath.shakeHand3d,
          ],
          onFadeOutFinished: (endIndex) {},
        ),
      ],
    );
  }
}
