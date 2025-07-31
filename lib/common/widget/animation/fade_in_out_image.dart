import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/image_widget.dart';

class FadeInOutImage extends HookConsumerWidget {
  const FadeInOutImage({
    super.key,
    required this.imagePathList,
    required this.onFadeOutFinished,
    this.width = 56,
  });

  final List<String> imagePathList;
  final double width;

  /// FadeOut 애니메이션이 끝났을 때 호출되는 콜백
  /// [FadeOutDown] 위젯의 onFinish 콜백으로 호출됨
  final void Function(int endIndex) onFadeOutFinished;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int> indexState = useState(0);
    final String imagePath = imagePathList[indexState.value];

    return SizedBox(
      width: width,
      height: width,
      child: FadeOutDown(
        key: ValueKey(imagePath),
        from: 16,
        onFinish: (_) {
          onFadeOutFinished(indexState.value);
          indexState.value = (indexState.value + 1) % imagePathList.length;
        },
        duration: const Duration(milliseconds: 420),
        delay: const Duration(milliseconds: 2000),
        child: FadeInDown(
          from: 16,
          duration: const Duration(milliseconds: 300),
          child: PngImageWidget(
            width: width,
            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
