import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/features/presentation/screens/details.dart';
import 'package:myfitbro/features/presentation/screens/family_screen.dart';
import 'package:myfitbro/features/presentation/screens/wods/add_wod.dart';
import 'package:myfitbro/features/presentation/screens/root_screen_a.dart';
import 'package:myfitbro/features/presentation/screens/stats_screen.dart';
import 'package:myfitbro/features/presentation/screens/wods/wods_screen.dart';
import 'package:myfitbro/features/presentation/widgets/shared/scaffold_with_nabvar.dart';
import 'package:myfitbro/features/presentation/widgets/shared/tabb_screen.dart';
import 'package:myfitbro/features/presentation/widgets/shared/tabbed_root_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  //final authState = ref.watch(authRemoteRepositoryProvider);

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _tabANavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'tabBNav');
// This example demonstrates how to setup nested navigation using a
// BottomNavigationBar, where each bar item uses its own persistent navigator,
// i.e. navigation state is maintained separately for each item. This setup also
// enables deep linking into nested pages.
//
// This example also demonstrates how build a nested shell with a custom
// container for the branch Navigators (in this case a TabBarView).

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // This nested StatefulShellRoute demonstrates the use of a
          // custom container for the branch Navigators. In this implementation,
          // no customization is done in the builder function (navigationShell
          // itself is simply used as the Widget for the route). Instead, the
          // navigatorContainerBuilder function below is provided to
          // customize the container for the branch Navigators.
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          // Returning a customized container for the branch
          // Navigators (i.e. the `List<Widget> children` argument).
          //
          // See ScaffoldWithNavBar for more details on how the children
          // are managed (using AnimatedBranchContainer).
          return ScaffoldWithNavBar(
              navigationShell: navigationShell, children: children);
        },
        branches: <StatefulShellBranch>[
          // The route branch for the first tab of the bottom navigation bar.
          // home
          StatefulShellBranch(
            navigatorKey: _tabANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.
                path: '/a',
                builder: (BuildContext context, GoRouterState state) =>
                    const RootScreenA(),
                routes: <RouteBase>[
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).

                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DetailsScreen(label: 'A'),
                  ),
                ],
              ),
            ],
          ),

          // Add wods
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.
                path: '/b',
                builder: (BuildContext context, GoRouterState state) =>
                    const WodScreen(),
                routes: <RouteBase>[
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'addwod',
                    builder: (BuildContext context, GoRouterState state) =>
                        const AddWodScreen(label: 'WODs'),
                  ),
                ],
              ),
            ],
          ),

          // screen with tabs
          // The route branch for the third tab of the bottom navigation bar.
          StatefulShellBranch(
            // StatefulShellBranch will automatically use the first descendant
            // GoRoute as the initial location of the branch. If another route
            // is desired, specify the location of it using the defaultLocation
            // parameter.
            // defaultLocation: '/c2',
            routes: <RouteBase>[
              StatefulShellRoute(
                builder: (BuildContext context, GoRouterState state,
                    StatefulNavigationShell navigationShell) {
                  // Just like with the top level StatefulShellRoute, no
                  // customization is done in the builder function.
                  return navigationShell;
                },
                navigatorContainerBuilder: (BuildContext context,
                    StatefulNavigationShell navigationShell,
                    List<Widget> children) {
                  // Returning a customized container for the branch
                  // Navigators (i.e. the `List<Widget> children` argument).
                  //
                  // See TabbedRootScreen for more details on how the children
                  // are managed (in a TabBarView).
                  return TabbedRootScreen(
                      navigationShell: navigationShell, children: children);
                },
                // This bottom tab uses a nested shell, wrapping sub routes in a
                // top TabBar.
                branches: <StatefulShellBranch>[
                  StatefulShellBranch(routes: <GoRoute>[
                    GoRoute(
                      path: '/c1',
                      builder: (BuildContext context, GoRouterState state) =>
                          const TabScreen(
                              label: 'C1', detailsPath: '/c1/details'),
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'details',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const DetailsScreen(
                            label: 'C1',
                            withScaffold: false,
                          ),
                        ),
                      ],
                    ),
                  ]),
                  StatefulShellBranch(routes: <GoRoute>[
                    GoRoute(
                      path: '/c2',
                      builder: (BuildContext context, GoRouterState state) =>
                          const TabScreen(
                              label: 'C2', detailsPath: '/c2/details'),
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'details',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const DetailsScreen(
                            label: 'C2',
                            withScaffold: false,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),

          // stats
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.

                path: '/d',
                builder: (BuildContext context, GoRouterState state) =>
                    const StatsScreen(),
                routes: <RouteBase>[
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).
                  GoRoute(
                      name: 'family',
                      path: 'family/:fid',
                      builder: (BuildContext context, GoRouterState state) {
                        return FamilyScreen(
                          fid: state.pathParameters['fid']!,
                          asc: state.uri.queryParameters['sort'] == 'asc',
                        );
                      }),
                  /*
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DetailsScreen(label: 'Stats'),
                  ),
                  */
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
