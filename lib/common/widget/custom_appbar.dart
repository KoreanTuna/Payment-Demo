import 'package:flutter/material.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.leading,
  });

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,

      leading: leading,

      title: Text(
        title,
        style: const TextStyle().body1,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
