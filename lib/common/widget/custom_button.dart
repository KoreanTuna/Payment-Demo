import 'package:flutter/material.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.width,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.applyBackgroundColor = true,
    this.applyBorderColor = false,
    this.textColor,
  });

  final String label;
  final double? width;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final bool applyBackgroundColor;
  final bool applyBorderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: applyBackgroundColor
              ? (isEnabled ? ColorStyle.primary500 : Colors.grey)
              : Colors.transparent,
          border: applyBorderColor
              ? Border.all(color: ColorStyle.primary500)
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Align(
              child: Container(
                height: 48,
                width: width,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: isEnabled
                              ? Colors.white
                              : ColorStyle.primary500,
                        )
                      : Text(
                          label,
                          style: const TextStyle().button.copyWith(
                            color:
                                textColor ??
                                (applyBackgroundColor
                                    ? (isEnabled
                                          ? Colors.white
                                          : ColorStyle.gray700)
                                    : ColorStyle.gray700),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
