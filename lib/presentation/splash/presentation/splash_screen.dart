import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/presentation/common/widget/base/base_screen.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Splash Screen',
      ),
    );
  }
}
