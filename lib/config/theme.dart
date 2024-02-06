import 'package:myfitbro/config/app_colors.dart';
import 'package:flutter/material.dart';

/// Default [ThemeData] for myfitbro
class AppTheme {
  /// Default constructor for myfitbro [ThemeData]
  AppTheme(this._brightness);

  final Brightness _brightness;

  /// Exposes theme data to MaterialApp
  ThemeData get themeData {
    return ThemeData(brightness: _brightness).copyWith(
      colorScheme: _colorScheme,
    );
  }

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: _brightness,
      );
}
