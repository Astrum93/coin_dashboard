/// API 관련 상수를 한곳에 모아둔다. (URL이 코드 곳곳에 흩어지는 걸 방지)
class ApiConstants {
  const ApiConstants._(); // 인스턴스화 금지 (상수 모음 용도)

  static const String base = 'https://api.coingecko.com/api/v3';

  /// CoinGecko 단순 시세 조회 URL.
  /// 예) simplePrice('bitcoin', 'krw') → '.../simple/price?ids=bitcoin&vs_currencies=krw'
  static String simplePrice(String id, String vsCurrency) =>
      '$base/simple/price?ids=$id&vs_currencies=$vsCurrency';
}
