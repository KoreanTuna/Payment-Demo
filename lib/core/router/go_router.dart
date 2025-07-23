import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/router/router_observer.dart';
import 'package:payment_demo/environment/getit.dart';
import 'package:payment_demo/feature/auth/presentation/entry_screen.dart';
import 'package:payment_demo/feature/auth/presentation/sign_up_screen.dart';
import 'package:payment_demo/feature/card/presentation/card_manual_input_screen.dart';
import 'package:payment_demo/feature/card/presentation/card_scan_screen.dart';
import 'package:payment_demo/feature/home/presentation/home_screen.dart';
import 'package:payment_demo/feature/splash/splash.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

CustomTransitionPage buildFadeTransitionPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: _fadeTransition,
  );
}

@module
abstract class GoRouterModule {
  @singleton
  GoRouter get router => GoRouter(
    navigatorKey: navigatorKey,
    observers: [locator<RouterObserver>()],
    initialLocation: '/${RoutePath.splash}',

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Container(),
        routes: [
          GoRoute(
            path: RoutePath.splash,
            name: RoutePath.splash,
            builder: (context, state) => const SplashScreen(),
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state: state,
              child: const SplashScreen(),
            ),
          ),
          GoRoute(
            path: RoutePath.entry,
            name: RoutePath.entry,
            builder: (context, state) => const EntryScreen(),
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state: state,
              child: const EntryScreen(),
            ),
            routes: [
              GoRoute(
                path: RoutePath.signUp,
                name: RoutePath.signUp,
                builder: (context, state) => const SignUpScreen(),
                pageBuilder: (context, state) => buildFadeTransitionPage(
                  state: state,
                  child: const SignUpScreen(),
                ),
                routes: [],
              ),
            ],
          ),
          GoRoute(
            path: RoutePath.home,
            name: RoutePath.home,
            builder: (context, state) => const HomeScreen(),
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state: state,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: RoutePath.cardScan,
            name: RoutePath.cardScan,
            builder: (context, state) => const CardScanScreen(),
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state: state,
              child: const CardScanScreen(),
            ),
          ),
          GoRoute(
            path: RoutePath.cardInfoInput,
            name: RoutePath.cardInfoInput,
            builder: (context, state) => const CardInfoInputScreen(),
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state: state,
              child: const CardInfoInputScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
