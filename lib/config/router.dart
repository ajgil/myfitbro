import 'package:myfitbro/features/auth/auth_provider.dart';
import 'package:myfitbro/features/auth/presentation/screens/auth_screen.dart';
import 'package:myfitbro/features/common/presentation/screens/error_screen.dart';
import 'package:myfitbro/features/common/presentation/utils/extensions/ui_extension.dart';
import 'package:myfitbro/features/dashboard/presentation/screens/dashboard_screen.dart';

import 'package:myfitbro/flavors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Main router for the myfitbro app
///
//! Pay attention to the order of routes.
/// Create:  myfitbro/create
/// View:    myfitbro/:eid
/// Edit:    myfitbro/:eid/edit
/// where :edit means myfitbro entity id.
///
//! Note about parameters
/// Router keeps parameters in global map. It means that if you create route
/// organization/:id and organization/:id/department/:id. Department id will
///  override organization id. So use :oid and :did instead of :id
/// Also router does not provide option to set regex for parameters.
/// If you put - myfitbro/:eid before - myfitbro/create for route - myfitbro/create
/// will be called route - myfitbro/:eid
///
///
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),),
    
    GoRoute(
      path: '/${AuthScreen.route}',
      name: AuthScreen.route,
      builder: (context, state) => const AuthScreen(),
    ),
  ],
  observers: [
    routeObserver,
  ],
  redirect: (context, state) {
    final loggedIn = authStateListenable.value;
    final goingToLogin = state.matchedLocation.contains('/${AuthScreen.route}');

    if (!loggedIn && !goingToLogin) {
      return '/${AuthScreen.route}';
    }
    if (loggedIn && goingToLogin) return '/dashboard';

    return null;
  },
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => ErrorScreen(message: context.tr.somethingWentWrong),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
