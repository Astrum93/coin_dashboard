// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';

/// pubspec.yaml 에 등록한 폰트 패밀리 이름.
abstract class AppFonts {
  static const String SANS = 'IBMPlexSansKR';
  static const String MONO = 'IBMPlexMono';

  /// mono 에 없는 글자(▲▼, 한글)를 대신 그릴 폰트.
  static const List<String> MONO_FALLBACK = [SANS];
}

/// 디자인 가이드 글자 스타일. 숫자는 mono 계열을 쓴다.
abstract class AppTextStyles {
  static const TextStyle TITLE = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.TEXT_PRIMARY,
  );

  static const TextStyle HEADING = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.TEXT_PRIMARY,
  );

  static const TextStyle BODY = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.TEXT_PRIMARY,
  );

  static const TextStyle BODY_STRONG = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.TEXT_PRIMARY,
  );

  static const TextStyle LABEL = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.TEXT_PRIMARY,
  );

  static const TextStyle CAPTION = TextStyle(
    fontFamily: AppFonts.SANS,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.TEXT_MUTED,
  );

  /// 상세 화면 현재가.
  static const TextStyle PRICE_DISPLAY = TextStyle(
    fontFamily: AppFonts.MONO,
    fontFamilyFallback: AppFonts.MONO_FALLBACK,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.7,
    color: AppColors.TEXT_PRIMARY,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  /// 요약 카드 수치.
  static const TextStyle NUMBER_LARGE = TextStyle(
    fontFamily: AppFonts.MONO,
    fontFamilyFallback: AppFonts.MONO_FALLBACK,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.TEXT_PRIMARY,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  /// 표·목록의 가격.
  static const TextStyle NUMBER = TextStyle(
    fontFamily: AppFonts.MONO,
    fontFamilyFallback: AppFonts.MONO_FALLBACK,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.TEXT_PRIMARY,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static const TextStyle NUMBER_SMALL = TextStyle(
    fontFamily: AppFonts.MONO,
    fontFamilyFallback: AppFonts.MONO_FALLBACK,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.TEXT_PRIMARY,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
