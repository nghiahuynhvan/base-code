import 'package:code_base/core/routing/routing_path.dart';
import 'package:code_base/presentation/home_page/home_page.dart';
import 'package:code_base/presentation/login_page/login_page.dart';
import 'package:code_base/presentation/you_page/you_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/main_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../locators/locators.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigationState = GlobalKey();
  /// Should to show splash
  bool isShouldShowSplash = true;

  /// Get current router URI
  Uri getCurrentRouteURI() {
    final router = diAppRouter.router;
    final lastMatch = router.routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    return matchList.uri;
  }

  late final router = GoRouter(
    navigatorKey: rootNavigationState,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routers.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routers.login,
        builder: (_, __) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) => MainScreen(navShell: navShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routers.home,
                builder: (_, __) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: Routers.you,
                  builder: (_, __) => const YouPage()),
            ],
          ),
        ],
      ),
    ],
    redirect: (_, state) {
      return null;
    },
  );
}
