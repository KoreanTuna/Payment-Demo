import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CardRegisterWidget extends StatelessWidget {
  const CardRegisterWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(12),
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
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
