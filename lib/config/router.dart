import 'dart:developer';

import 'package:myfitbro/features/auth/auth_provider.dart';
import 'package:myfitbro/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:myfitbro/features/auth/presentation/screens/login_screen.dart';
import 'package:myfitbro/features/common/presentation/screens/error_screen.dart';
import 'package:myfitbro/features/common/presentation/utils/extensions/ui_extension.dart';
import 'package:myfitbro/features/dashboard/presentation/screens/dashboard_screen.dart';

//import 'package:myfitbro/flavors.dart';
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
  initialLocation: '/splash',
  routes: [
    // primera pantalla
    GoRoute(
      path: '/splash',
      builder: (context, state) => const CheckAuthStatusScreen(),
    ),

    // Auth routes
    GoRoute(
      path: '/login',
      //name: AuthScreen.route,
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
    final authStatus = authStateListenable.value;
    final isGoingTo = state.matchedLocation.contains;

    // ignore: unrelated_type_equality_checks
    if (isGoingTo == '/splash' && authStatus == true) return null;

    if (authStatus == false) {
      // ignore: unrelated_type_equality_checks
      if (isGoingTo == '/login') return null;

      return '/login';
    }
    if (authStatus == true) {
      // ignore: unrelated_type_equality_checks
      if (isGoingTo == '/login' || isGoingTo == '/splash') {
        return '/';
      }
    }
    return null;
  },

  /*
   redirect: (context, state) {
    final loggedIn = authStateListenable.value;
    final goingToLogin = state.matchedLocation.contains('/${CheckAuthStatusScreen.route}');

    // ignore: unrelated_type_equality_checks
    if (loggedIn == false && goingToLogin == false) {
      return '/${CheckAuthStatusScreen.route}';
    }
    if (loggedIn == true && goingToLogin == true) return '/';

    return null;
  },

*/
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) =>
      ErrorScreen(message: context.tr.somethingWentWrong),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
