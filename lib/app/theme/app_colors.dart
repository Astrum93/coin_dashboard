// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

/// 디자인 가이드 색상 토큰.
abstract class AppColors {
  static const Color BACKGROUND = Color(0xFF0E0F12);
  static const Color SIDEBAR = Color(0xFF0B0C0F);
  static const Color SURFACE = Color(0xFF16181D); // 카드
  static const Color SURFACE_RAISED = Color(0xFF1C1F25); // 선택된 메뉴, 강조 행
  static const Color SURFACE_SUNKEN = Color(0xFF121418); // 표 헤더
  static const Color BORDER = Color(0xFF262A31);
  static const Color DIVIDER = Color(0xFF1F2228);

  static const Color TEXT_PRIMARY = Color(0xFFECEEF2);
  static const Color TEXT_MUTED = Color(0xFF8B919C);

  static const Color ACCENT = Color(0xFFD4FF3F);
  static const Color ON_ACCENT = Color(0xFF0E0F12);

  static const Color RISE = Color(0xFFFF5C64); // 상승(빨강)
  static const Color FALL = Color(0xFF5B9BFF); // 하락(파랑)

  /// 등락률 부호에 맞는 색. 0 은 상승으로 본다.
  static Color change(num rate) => rate >= 0 ? RISE : FALL;
}
