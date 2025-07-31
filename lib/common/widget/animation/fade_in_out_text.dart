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

  /// 애니메이션 적용 텍스트
  final String text;

  /// 텍스트 스타일
  /// 기본값은 [TextStyle().subTitle1]
  final TextStyle? style;

  /// FadeOut 애니메이션이 끝났을 때 호출되는 콜백
  /// [FadeOutDown] 위젯의 onFinish 콜백으로 호출됨
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
