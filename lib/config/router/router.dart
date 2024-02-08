import 'package:myfitbro/features/auth/auth_provider.dart';
import 'package:myfitbro/features/auth/presentation/screens/login_screen.dart';
import 'package:myfitbro/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:myfitbro/features/common/presentation/screens/error_screen.dart';
import 'package:myfitbro/features/common/presentation/utils/extensions/ui_extension.dart';
import 'package:myfitbro/features/dashboard/presentation/screens/dashboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Main router for the myfitbro app

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // primera pantalla
    GoRoute(
      path: '/splash',
      builder: (context, state) => const CheckAuthStatusScreen(),
    ),

    //* Auth routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      //name: AuthScreen.route,
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
  observers: [
    routeObserver,
  ],
  redirect: (context, state) {
    final loggedIn = authStateListenable.value;
    final isGoingTo = state.matchedLocation;
    final goingToLogin = state.matchedLocation.contains('/splash');

    print('GoRouter authStatus $loggedIn, isGoingTo $isGoingTo');

    if (!loggedIn && !goingToLogin) {
      return '/login';
    }
    if (loggedIn && goingToLogin) return '/';

    return null;
  },
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) =>
      ErrorScreen(message: context.tr.somethingWentWrong),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
