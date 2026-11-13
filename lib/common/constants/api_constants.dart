/// API 상수.
class ApiConstants {
  const ApiConstants._(); // 인스턴스화 금지

  static const String base = 'https://api.upbit.com/v1';

  /// 원화 마켓 전체 현재가.
  static const String krwTickers = '$base/ticker/all?quote_currencies=KRW';

  /// 전체 마켓 목록 (한글명 포함).
  static const String marketAll = '$base/market/all?isDetails=false';

  /// 캔들 URL. path 예: 'minutes/30', 'days', 'weeks'
  static String candles(String path, String market, int count) =>
      '$base/candles/$path?market=$market&count=$count';
}
