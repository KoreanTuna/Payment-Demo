import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/core/router/route_path.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.goNamed(RoutePath.entry);
      });
    });

    return const Center(
      child: Text(
        'Splash Screen',
      ),
    );
  }
}
