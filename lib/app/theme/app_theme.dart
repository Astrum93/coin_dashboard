import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// 앱 전역 다크 테마.
abstract class AppTheme {
  static const double radiusCard = 16;

  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      secondary: AppColors.accent,
      onSecondary: AppColors.onAccent,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textMuted,
      outline: AppColors.border,
      outlineVariant: AppColors.divider,
      error: AppColors.rise,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      fontFamily: AppFonts.sans,
      scaffoldBackgroundColor: AppColors.background,
      dividerColor: AppColors.divider,
      // 터치·hover 피드백 색.
      hoverColor: AppColors.textPrimary.withValues(alpha: 0.04),
      focusColor: AppColors.textPrimary.withValues(alpha: 0.08),
      highlightColor: AppColors.textPrimary.withValues(alpha: 0.04),
      splashColor: AppColors.textPrimary.withValues(alpha: 0.08),
      textTheme: const TextTheme(
        headlineSmall: AppTextStyles.title,
        titleMedium: AppTextStyles.heading,
        bodyMedium: AppTextStyles.body,
        labelLarge: AppTextStyles.label,
        bodySmall: AppTextStyles.caption,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: AppTextStyles.heading,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accent,
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceRaised,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textStyle: AppTextStyles.caption,
      ),
    );
  }
}
