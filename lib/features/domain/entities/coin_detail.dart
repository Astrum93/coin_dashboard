import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail.freezed.dart';

/// 상세 화면용 한 종목 시세. 고가·저가·시가는 당일(KST 09시 기준) 값.
@freezed
abstract class CoinDetail with _$CoinDetail {
  const factory CoinDetail({
    required String market, // 예: 'KRW-BTC'
    required String symbol, // 예: 'BTC'
    required String koreanName, // 예: '비트코인'
    required String englishName, // 예: 'Bitcoin'
    required double price,
    required double changeRate, // 전일 대비 퍼센트. 1.82 = 1.82%
    required double changePrice, // 전일 대비 금액 (부호 포함)
    required double prevClosingPrice,
    required double openingPrice,
    required double highPrice,
    required double lowPrice,
    required double tradeVolume24h, // 24시간 누적 거래량(코인 개수)
    required double tradePrice24h, // 24시간 누적 거래대금(원)
    required double highest52WeekPrice,
    required double lowest52WeekPrice,
  }) = _CoinDetail;
}
