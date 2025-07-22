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

  factory CustomButton.border({
    required String label,
    double? width,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    Color? textColor,
    bool applyBackgroundColor = false,
    bool applyBorderColor = true,
  }) {
    return CustomButton(
      label: label,
      width: width,
      onPressed: onPressed,
      isLoading: isLoading,
      isEnabled: isEnabled,
      applyBackgroundColor: applyBackgroundColor,
      applyBorderColor: applyBorderColor,
      textColor: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: applyBackgroundColor
              ? (isEnabled ? ColorStyle.primary500 : ColorStyle.gray200)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: applyBorderColor
              ? Border.all(
                  color: isEnabled ? ColorStyle.primary500 : ColorStyle.gray400,
                )
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnabled && !isLoading ? onPressed : null,
            child: Align(
              child: Container(
                height: 48,
                width: width,
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
                                          : ColorStyle.gray400)
                                    : isEnabled
                                    ? ColorStyle.primary500
                                    : ColorStyle.gray400),
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
