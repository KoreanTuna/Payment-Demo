import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

enum CheckStatus {
  checked,
  unchecked,
}

class CustomCheckBox extends HookConsumerWidget {
  const CustomCheckBox({
    super.key,
    required this.onChanged,
    this.label,
    this.status = CheckStatus.unchecked,
  });

  final void Function(CheckStatus) onChanged;
  final String? label;
  final CheckStatus status;

  factory CustomCheckBox.labeld({
    required String label,
    CheckStatus status = CheckStatus.unchecked,
    bool initWithChecked = false,
    required void Function(CheckStatus) onChanged,
  }) {
    return CustomCheckBox(
      onChanged: onChanged,
      status: initWithChecked ? CheckStatus.checked : status,
      label: label,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<CheckStatus> checkState = useState(status);

    useEffect(
      () {
        checkState.value = status;
        return null;
      },
      [status],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          checkState.value = checkState.value == CheckStatus.checked
              ? CheckStatus.unchecked
              : CheckStatus.checked;
          onChanged(checkState.value);
        },
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: checkState.value == CheckStatus.checked
                    ? ColorStyle.primary500
                    : ColorStyle.gray200,
              ),
              child: Center(
                child: Icon(
                  size: 16,
                  Icons.check_rounded,
                  color: checkState.value == CheckStatus.checked
                      ? Colors.white
                      : ColorStyle.gray400,
                ),
              ),
            ),
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label!,
                  style: const TextStyle().body2,
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
