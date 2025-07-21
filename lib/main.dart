import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/util/provider_logger.dart';
import 'package:payment_demo/environment/app_builder.dart';
import 'package:payment_demo/environment/getit.dart';

void main() async {
  await AppBuilder.init();
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: locator<GoRouter>(),
    );
  }
}
