import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/theme/color_style.dart';

/// Step별 Container를 보여주며 Step Progress가 변경될때마다
/// Container의 크기와 색상이 달라지는 애니메이션 제공

class StepProgressIndicator extends HookConsumerWidget {
  const StepProgressIndicator({
    super.key,
    required this.currentStepIndex,
    required this.totalSteps,
    required this.onStepChanged,
  });

  final int currentStepIndex;
  final int totalSteps;
  final void Function(int) onStepChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(milliseconds: 180),
    );
    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    useEffect(() {
      controller.forward(from: 0);
      return null;
    }, [currentStepIndex]);

    return Row(
      spacing: 2,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        final bool isActive = index == currentStepIndex;

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final animationValue = animation.value;
            final width = isActive ? 8 + (24 - 8) * animationValue : 8;
            final color = isActive
                ? Color.lerp(
                    ColorStyle.gray400,
                    ColorStyle.primary500,
                    animationValue,
                  )
                : ColorStyle.gray400;
            return Container(
              height: 8,
              width: width.toDouble(),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(36.0),
              ),
            );
          },
        );
      }),
    );
  }
}
