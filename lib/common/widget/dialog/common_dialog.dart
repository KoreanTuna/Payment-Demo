import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.title,
    this.message,
    required this.onPrimaryAction,
  });

  final String title;
  final String? message;
  final VoidCallback onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle().subTitle4,
            ),
            const SizedBox(height: 8.0),
            Text(
              message ?? '',
              style: const TextStyle().body1,
            ),
            const SizedBox(height: 16.0),
            CustomButton.border(
              label: '확인',
              onPressed: onPrimaryAction,
            ),
          ],
        ),
      ),
    );
  }
}
