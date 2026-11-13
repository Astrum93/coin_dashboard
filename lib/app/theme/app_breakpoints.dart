// ignore_for_file: constant_identifier_names
/// 화면 폭 기준 레이아웃 전환점.
abstract class AppBreakpoints {
  static const double COMPACT = 520; // 요약 카드 1열 → 2열
  static const double TABLET = 600; // 본문 여백 확대, 차트 축 라벨 5개
  static const double SIDEBAR = 900; // 상단 메뉴 → 사이드바
  static const double DESKTOP = 1000; // 요약 카드 4열, 본문 2단
}
