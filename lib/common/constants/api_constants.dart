/// API 상수.
class ApiConstants {
  const ApiConstants._(); // 인스턴스화 금지

  static const String base = 'https://api.upbit.com/v1';

  /// 업비트 현재가 URL. market 예: 'KRW-BTC'
  static String ticker(String market) => '$base/ticker?markets=$market';
}
