import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/orderbook.dart';

part 'orderbook_model.freezed.dart';

/// 업비트 orderbook DTO.
@freezed
abstract class OrderbookModel with _$OrderbookModel {
  const OrderbookModel._();

  const factory OrderbookModel({
    required List<Map<String, dynamic>> orderbookUnits,
    required double totalAskSize,
    required double totalBidSize,
  }) = _OrderbookModel;

  /// 업비트 orderbook 한 건 파싱.
  factory OrderbookModel.fromJson(Map<String, dynamic> json) {
    return OrderbookModel(
      orderbookUnits: (json['orderbook_units'] as List<dynamic>)
          .cast<Map<String, dynamic>>(),
      totalAskSize: (json['total_ask_size'] as num).toDouble(),
      totalBidSize: (json['total_bid_size'] as num).toDouble(),
    );
  }

  /// DTO → 엔티티.
  Orderbook toEntity() => Orderbook(
    units: [
      for (final u in orderbookUnits)
        OrderbookUnit(
          askPrice: (u['ask_price'] as num).toDouble(),
          askSize: (u['ask_size'] as num).toDouble(),
          bidPrice: (u['bid_price'] as num).toDouble(),
          bidSize: (u['bid_size'] as num).toDouble(),
        ),
    ],
    totalAskSize: totalAskSize,
    totalBidSize: totalBidSize,
  );
}
