import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/custom_text_field.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class InfoInputWidget extends StatelessWidget {
  const InfoInputWidget({
    super.key,
    required this.title,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.isObscureText = false,
    this.isDisabled = false,
  });

  final String title;
  final String? initialValue;
  final String hintText;
  final void Function(String) onChanged;
  final bool isObscureText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle().subTitle6,
          ),
          CustomTextField(
            hintText: hintText,
            initialValue: initialValue,
            onChanged: onChanged,
            isObscureText: isObscureText,
            isDisabled: isDisabled,
          ),
        ],
      ),
    );
  }
}
