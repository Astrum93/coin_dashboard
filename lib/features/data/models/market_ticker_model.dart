import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';

part 'market_ticker_model.freezed.dart';

/// 업비트 ticker DTO.
@freezed
abstract class MarketTickerModel with _$MarketTickerModel {
  const MarketTickerModel._();

  const factory MarketTickerModel({
    required String market,
    required double tradePrice,
    required double signedChangeRate, // 0.0182 = 1.82%
    required double signedChangePrice,
    required double accTradePrice24h,
    required double highPrice,
    required double lowPrice,
  }) = _MarketTickerModel;

  /// 업비트 ticker 한 건 파싱.
  factory MarketTickerModel.fromJson(Map<String, dynamic> json) {
    return MarketTickerModel(
      market: json['market'] as String,
      tradePrice: (json['trade_price'] as num).toDouble(),
      signedChangeRate: (json['signed_change_rate'] as num).toDouble(),
      signedChangePrice: (json['signed_change_price'] as num).toDouble(),
      accTradePrice24h: (json['acc_trade_price_24h'] as num).toDouble(),
      highPrice: (json['high_price'] as num).toDouble(),
      lowPrice: (json['low_price'] as num).toDouble(),
    );
  }

  /// DTO → 엔티티. 한글명은 마켓 목록에서 따로 받아 넣는다.
  MarketTicker toEntity({required String koreanName}) => MarketTicker(
    market: market,
    symbol: market.split('-').last,
    koreanName: koreanName,
    price: tradePrice,
    changeRate: signedChangeRate * 100,
    changePrice: signedChangePrice,
    tradePrice24h: accTradePrice24h,
    highPrice: highPrice,
    lowPrice: lowPrice,
  );
}
