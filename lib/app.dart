import 'package:myfitbro/config/router.dart';
import 'package:myfitbro/config/theme/app_theme.dart';
import 'package:myfitbro/flavors.dart';
import 'package:flutter/material.dart';
import 'package:myfitbro/l10n/app_localizations.dart';
//import 'config/theme/app_theme.dart';

/// Main myfitbro app class
class MyFitBro extends StatelessWidget {
  /// Default constructor for myfitbro app
  const MyFitBro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      //theme: AppTheme(Brightness.light).themeData,
      //darkTheme: AppTheme(Brightness.dark).themeData,
      theme: AppTheme().getTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}