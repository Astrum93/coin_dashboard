/// 앱의 모든 경로(URL)를 한곳에 모아둔다.
/// 문자열을 직접 쓰지 않고 상수로 관리하면 오타를 막고, 경로가 바뀌어도
/// 여기 한 곳만 고치면 된다.
abstract class AppRoutes {
  /// 홈(시세) 화면. 웹 주소창의 '/' 에 해당.
  static const String home = '/';

  /// 코인 상세 화면. ':symbol' 은 URL에서 변하는 부분(경로 파라미터).
  static const String coinDetail = '/coin/:symbol';

  /// 특정 코인 상세 경로 문자열을 만들어주는 헬퍼.
  /// coinDetailPath('BTC') → '/coin/BTC'
  static String coinDetailPath(String symbol) => '/coin/$symbol';
}
