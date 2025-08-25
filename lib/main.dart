import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/util/provider_logger.dart';
import 'package:payment_demo/environment/app_builder.dart';
import 'package:payment_demo/environment/getit.dart';

void main() async {
  await AppBuilder.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('th'),
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child: ProviderScope(
        observers: [ProviderLogger()],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: locator<GoRouter>(),
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) {
                      return child!;
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
