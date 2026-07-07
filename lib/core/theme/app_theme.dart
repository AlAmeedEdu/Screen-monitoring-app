import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_palette.dart';

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
abstract final class AppTheme {
  /// يبني إعدادات الثيم المطلوبة للتطبيق.
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'IBM Plex Sans Arabic',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      extensions: const [AppPalette.light],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        filled: true,
        fillColor: AppColors.surface,
      ),
    );
  }

  /// يبني إعدادات الثيم المطلوبة للتطبيق.
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'IBM Plex Sans Arabic',
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF4DB6C2),
        secondary: Color(0xFF4ADE80),
        surface: Color(0xFF101C1F),
      ),
      scaffoldBackgroundColor: AppPalette.dark.canvas,
      extensions: const [AppPalette.dark],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppPalette.dark.primaryText,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        filled: true,
        fillColor: AppPalette.dark.surface,
      ),
    );
  }
}
