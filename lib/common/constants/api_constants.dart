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

  /// CoinGecko 공개 API. 분당 호출 수 제한이 낮아 결과를 캐시해서 쓴다.
  static const String coinGeckoBase = 'https://api.coingecko.com/api/v3';

  /// 심볼·이름 검색. 시가총액 순으로 온다.
  static String coinGeckoSearch(String query) =>
      '$coinGeckoBase/search?query=${Uri.encodeQueryComponent(query)}';

  /// 코인 상세 중 링크만 쓰므로 나머지 데이터는 끈다.
  static String coinGeckoCoin(String id) =>
      '$coinGeckoBase/coins/$id?localization=false&tickers=false'
      '&market_data=false&community_data=false&developer_data=false';

  /// RSS → JSON 변환 서비스. 나중에 자체 프록시로 바꾸면 여기만 고친다.
  static String rssToJson(String feedUrl) =>
      'https://api.rss2json.com/v1/api.json'
      '?rss_url=${Uri.encodeQueryComponent(feedUrl)}';

  /// 뉴스 피드. 매체 이름 → RSS 주소.
  static const Map<String, String> newsFeeds = {
    '블록미디어': 'https://www.blockmedia.co.kr/feed',
    '토큰포스트': 'https://www.tokenpost.kr/rss',
  };

  /// 관련 기사가 없을 때 여는 Google 뉴스 검색 페이지.
  static String googleNewsSearch(String query) =>
      'https://news.google.com/search'
      '?q=${Uri.encodeQueryComponent(query)}&hl=ko&gl=KR&ceid=KR:ko';

  /// 캔들 한 번에 받을 수 있는 최대 개수.
  static const int candleMaxCount = 200;

  /// 캔들 URL. path 예: 'minutes/30', 'days', 'weeks'
  /// [to] 는 UTC 'yyyy-MM-ddTHH:mm:ssZ', 이 시각은 결과에서 빠진다.
  static String candles(String path, String market, int count, {String? to}) {
    final url = '$base/candles/$path?market=$market&count=$count';
    return to == null ? url : '$url&to=${Uri.encodeQueryComponent(to)}';
  }
}
