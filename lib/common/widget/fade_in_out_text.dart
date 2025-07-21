import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class FadeInOutText extends StatelessWidget {
  const FadeInOutText({
    super.key,
    required this.text,
    this.style,
    required this.onFadeOutFinished,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback onFadeOutFinished;

  @override
  Widget build(BuildContext context) {
    return FadeOutDown(
      from: 20,
      onFinish: (_) => onFadeOutFinished(),
      duration: const Duration(milliseconds: 420),
      delay: const Duration(milliseconds: 2000),
      child: FadeInDown(
        from: 20,
        duration: const Duration(milliseconds: 300),
        child: Text(
          text,
          style: style ?? const TextStyle().subTitle1,
        ),
      ),
    );
  }
}
