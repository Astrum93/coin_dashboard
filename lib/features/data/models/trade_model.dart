import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/trade.dart';

part 'trade_model.freezed.dart';

/// 업비트 trades/ticks DTO.
@freezed
abstract class TradeModel with _$TradeModel {
  const TradeModel._();

  const factory TradeModel({
    required int sequentialId,
    required int timestamp, // ms
    required double tradePrice,
    required double tradeVolume,
    required String askBid, // 'BID' 매수 체결, 'ASK' 매도 체결
  }) = _TradeModel;

  /// 업비트 체결 한 건 파싱.
  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      sequentialId: (json['sequential_id'] as num).toInt(),
      timestamp: (json['timestamp'] as num).toInt(),
      tradePrice: (json['trade_price'] as num).toDouble(),
      tradeVolume: (json['trade_volume'] as num).toDouble(),
      askBid: json['ask_bid'] as String,
    );
  }

  /// DTO → 엔티티. 시각은 기기 로컬 시간대.
  Trade toEntity() => Trade(
    id: sequentialId,
    time: DateTime.fromMillisecondsSinceEpoch(timestamp),
    price: tradePrice,
    volume: tradeVolume,
    isBuy: askBid == 'BID',
  );
}
