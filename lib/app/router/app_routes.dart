/// 앱 경로 상수.
abstract class AppRoutes {
  static const String home = '/';

  /// 홈의 하위 라우트라 상대 경로. 실제 URL 은 '/coin/BTC'.
  static const String coinDetail = 'coin/:symbol';

  /// 이동용 절대 경로. coinDetailPath('BTC') → '/coin/BTC'
  static String coinDetailPath(String symbol) => '/coin/$symbol';
}
