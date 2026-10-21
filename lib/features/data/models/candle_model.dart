import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/candle.dart';

part 'candle_model.freezed.dart';

/// 업비트 캔들 DTO.
@freezed
abstract class CandleModel with _$CandleModel {
  const CandleModel._();

  const factory CandleModel({
    required String candleDateTimeKst, // 예: '2026-10-21T23:00:00'
    required double openingPrice,
    required double highPrice,
    required double lowPrice,
    required double tradePrice,
    required double candleAccTradeVolume,
  }) = _CandleModel;

  /// 업비트 캔들 한 건 파싱.
  factory CandleModel.fromJson(Map<String, dynamic> json) {
    return CandleModel(
      candleDateTimeKst: json['candle_date_time_kst'] as String,
      openingPrice: (json['opening_price'] as num).toDouble(),
      highPrice: (json['high_price'] as num).toDouble(),
      lowPrice: (json['low_price'] as num).toDouble(),
      tradePrice: (json['trade_price'] as num).toDouble(),
      candleAccTradeVolume: (json['candle_acc_trade_volume'] as num).toDouble(),
    );
  }

  /// DTO → 엔티티.
  Candle toEntity() => Candle(
    time: DateTime.parse(candleDateTimeKst),
    open: openingPrice,
    high: highPrice,
    low: lowPrice,
    close: tradePrice,
    volume: candleAccTradeVolume,
  );
}
