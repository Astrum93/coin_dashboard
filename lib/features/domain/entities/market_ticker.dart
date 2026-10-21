import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_ticker.freezed.dart';

/// 마켓 한 종목의 현재가 요약.
@freezed
abstract class MarketTicker with _$MarketTicker {
  const factory MarketTicker({
    required String market, // 예: 'KRW-BTC'
    required String symbol, // 예: 'BTC'
    required String koreanName, // 예: '비트코인'
    required double price,
    required double changeRate, // 전일 대비 퍼센트. 1.82 = 1.82%
    required double changePrice, // 전일 대비 금액 (부호 포함)
    required double tradePrice24h, // 24시간 누적 거래대금(원)
    required double highPrice,
    required double lowPrice,
  }) = _MarketTicker;
}
