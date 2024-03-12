import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/config/router/router_path.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';
import 'package:myfitbro/features/auth/presentation/screens/login_screen.dart';
import 'package:myfitbro/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authRemoteRepositoryProvider);

  return GoRouter(
    debugLogDiagnostics: true,
      initialLocation: RouterPath.signin,


      routes: [
        GoRoute(
          path: RouterPath.signin,
          name: RouterPath.signin,
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: RouterPath.signup,
              name: RouterPath.signup,
              builder: (context, state) {
                return const DashboardScreen(); //const SignUpPage();
              },
            ),
            GoRoute(
              path: RouterPath.document,
              name: RouterPath.document,
              builder: (context, state) {
                return const DashboardScreen(); //return const DocumentPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: RouterPath.home,
          name: RouterPath.home,
          builder: (context, state) {
            return const DashboardScreen();
          },
        ),
      ],



      redirect: (context, state) async {

        // If our async state is loading, don't perform redirects, yet
        //if (authState.isLoading || authState.hasError) return null;

        final loggedIn = authState.currentSession?.user != null;

        log('variable loggedIn: $loggedIn');
        log('state location $state');


        switch (state.matchedLocation) {
          case RouterPath.signin:
            if (loggedIn) {
              return RouterPath.home;
            } else {
              return RouterPath.signin;
            }
          case RouterPath.signup:
            if (loggedIn) {
              return RouterPath.home;
            } else {
              return RouterPath.signup;
            }
          case RouterPath.home:
            if (loggedIn) {
              return RouterPath.home;
            } else {
              return RouterPath.signin;
            }
          default:
            return null;
        }
      },
      
      // Pangina no encontrada -> 404
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ));
      });
}
