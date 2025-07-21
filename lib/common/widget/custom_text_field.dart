import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CustomTextField extends HookConsumerWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.isObscureText = false,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final bool isObscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final FocusNode focusNode = useFocusNode();

    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscureText,
      style: const TextStyle().body1,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle().body1.copyWith(
          color: ColorStyle.coolGray300,
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: ColorStyle.coolGray500),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: ColorStyle.gray300),
        ),
      ),
      cursorColor: ColorStyle.primary500,

      onChanged: (value) {
        onChanged?.call(value);
      },
    );
  }
}
