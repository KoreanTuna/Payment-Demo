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
    this.isDisabled = false,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final bool isObscureText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final FocusNode focusNode = useFocusNode();

    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscureText,
      enabled: !isDisabled,
      style: TextStyle().body1.copyWith(
        color: isDisabled ? ColorStyle.coolGray300 : ColorStyle.gray850,
      ),

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle().body1.copyWith(
          color: ColorStyle.coolGray300,
        ),
        fillColor: isDisabled ? ColorStyle.gray400 : ColorStyle.white,
        focusColor: isDisabled ? ColorStyle.gray400 : ColorStyle.white,

        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: ColorStyle.coolGray300),
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
