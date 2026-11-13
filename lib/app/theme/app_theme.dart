// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// 앱 전역 다크 테마.
abstract class AppTheme {
  static const double RADIUS_CARD = 16;

  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: AppColors.ACCENT,
      onPrimary: AppColors.ON_ACCENT,
      secondary: AppColors.ACCENT,
      onSecondary: AppColors.ON_ACCENT,
      surface: AppColors.SURFACE,
      onSurface: AppColors.TEXT_PRIMARY,
      onSurfaceVariant: AppColors.TEXT_MUTED,
      outline: AppColors.BORDER,
      outlineVariant: AppColors.DIVIDER,
      error: AppColors.RISE,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      fontFamily: AppFonts.SANS,
      scaffoldBackgroundColor: AppColors.BACKGROUND,
      dividerColor: AppColors.DIVIDER,
      // 터치·hover 피드백 색.
      hoverColor: AppColors.TEXT_PRIMARY.withValues(alpha: 0.04),
      focusColor: AppColors.TEXT_PRIMARY.withValues(alpha: 0.08),
      highlightColor: AppColors.TEXT_PRIMARY.withValues(alpha: 0.04),
      splashColor: AppColors.TEXT_PRIMARY.withValues(alpha: 0.08),
      textTheme: const TextTheme(
        headlineSmall: AppTextStyles.TITLE,
        titleMedium: AppTextStyles.HEADING,
        bodyMedium: AppTextStyles.BODY,
        labelLarge: AppTextStyles.LABEL,
        bodySmall: AppTextStyles.CAPTION,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.BACKGROUND,
        foregroundColor: AppColors.TEXT_PRIMARY,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: AppTextStyles.HEADING,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.ACCENT,
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.SURFACE_RAISED,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textStyle: AppTextStyles.CAPTION,
      ),
    );
  }
}
