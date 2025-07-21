import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/custom_text_field.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class InfoInputWidget extends StatelessWidget {
  const InfoInputWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChanged,
    this.isObscureText = false,
  });

  final String title;
  final String hintText;
  final void Function(String) onChanged;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle().subTitle6,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          hintText: hintText,
          onChanged: onChanged,
          isObscureText: isObscureText,
        ),
      ],
    );
  }
}
