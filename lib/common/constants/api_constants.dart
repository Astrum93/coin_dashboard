/// API 상수.
class ApiConstants {
  const ApiConstants._(); // 인스턴스화 금지

  static const String base = 'https://api.upbit.com/v1';

  /// 한 종목 현재가. market 예: 'KRW-BTC'
  static String ticker(String market) => '$base/ticker?markets=$market';

  /// 원화 마켓 전체 현재가.
  static const String krwTickers = '$base/ticker/all?quote_currencies=KRW';

  /// 전체 마켓 목록 (한글명 포함).
  static const String marketAll = '$base/market/all?isDetails=false';

  /// 호가. levels 는 단계 수 (최대 30).
  static String orderbook(String market, int levels) =>
      '$base/orderbook?markets=$market&count=$levels';

  /// 최근 체결. 최신이 앞에 온다.
  static String trades(String market, int count) =>
      '$base/trades/ticks?market=$market&count=$count';

  /// 캔들 한 번에 받을 수 있는 최대 개수.
  static const int candleMaxCount = 200;

  /// 캔들 URL. path 예: 'minutes/30', 'days', 'weeks'
  /// [to] 는 UTC 'yyyy-MM-ddTHH:mm:ssZ', 이 시각은 결과에서 빠진다.
  static String candles(String path, String market, int count, {String? to}) {
    final url = '$base/candles/$path?market=$market&count=$count';
    return to == null ? url : '$url&to=${Uri.encodeQueryComponent(to)}';
  }
}
