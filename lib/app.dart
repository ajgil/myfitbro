//import 'package:myfitbro/config/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/config/router/router.dart';
import 'package:myfitbro/config/theme/app_theme.dart';
import 'package:myfitbro/flavors.dart';
import 'package:flutter/material.dart';
//import 'config/theme/app_theme.dart';

/// Main myfitbro app class
class MyFitBro extends ConsumerWidget {
  /// Default constructor for myfitbro app
  const MyFitBro({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final routes = ref.watch(appRouterProvider);
    final _routes = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: F.title,
      //theme: AppTheme(Brightness.light).themeData,
      //darkTheme: AppTheme(Brightness.dark).themeData,
      theme: AppTheme().getTheme(),
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      //routerConfig: routes,
      routerConfig: _routes,
    );
  }
}
