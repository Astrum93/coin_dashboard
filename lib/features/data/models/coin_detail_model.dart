import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';

part 'coin_detail_model.freezed.dart';

/// 업비트 단일 ticker DTO.
@freezed
abstract class CoinDetailModel with _$CoinDetailModel {
  const CoinDetailModel._();

  const factory CoinDetailModel({
    required String market,
    required double tradePrice,
    required double signedChangeRate, // 0.0182 = 1.82%
    required double signedChangePrice,
    required double prevClosingPrice,
    required double openingPrice,
    required double highPrice,
    required double lowPrice,
    required double accTradeVolume24h,
    required double accTradePrice24h,
    required double highest52WeekPrice,
    required double lowest52WeekPrice,
  }) = _CoinDetailModel;

  /// 업비트 ticker 한 건 파싱.
  factory CoinDetailModel.fromJson(Map<String, dynamic> json) {
    double read(String key) => (json[key] as num).toDouble();
    return CoinDetailModel(
      market: json['market'] as String,
      tradePrice: read('trade_price'),
      signedChangeRate: read('signed_change_rate'),
      signedChangePrice: read('signed_change_price'),
      prevClosingPrice: read('prev_closing_price'),
      openingPrice: read('opening_price'),
      highPrice: read('high_price'),
      lowPrice: read('low_price'),
      accTradeVolume24h: read('acc_trade_volume_24h'),
      accTradePrice24h: read('acc_trade_price_24h'),
      highest52WeekPrice: read('highest_52_week_price'),
      lowest52WeekPrice: read('lowest_52_week_price'),
    );
  }

  /// DTO → 엔티티. 이름은 마켓 목록에서 따로 받아 넣는다.
  CoinDetail toEntity({
    required String koreanName,
    required String englishName,
  }) => CoinDetail(
    market: market,
    symbol: market.split('-').last,
    koreanName: koreanName,
    englishName: englishName,
    price: tradePrice,
    changeRate: signedChangeRate * 100,
    changePrice: signedChangePrice,
    prevClosingPrice: prevClosingPrice,
    openingPrice: openingPrice,
    highPrice: highPrice,
    lowPrice: lowPrice,
    tradeVolume24h: accTradeVolume24h,
    tradePrice24h: accTradePrice24h,
    highest52WeekPrice: highest52WeekPrice,
    lowest52WeekPrice: lowest52WeekPrice,
  );
}
