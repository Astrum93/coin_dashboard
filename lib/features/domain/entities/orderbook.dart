import 'package:freezed_annotation/freezed_annotation.dart';

part 'orderbook.freezed.dart';

/// 호가 한 단계. 매도·매수가 한 쌍으로 온다.
@freezed
abstract class OrderbookUnit with _$OrderbookUnit {
  const factory OrderbookUnit({
    required double askPrice,
    required double askSize,
    required double bidPrice,
    required double bidSize,
  }) = _OrderbookUnit;
}

/// 호가창. units[0] 이 현재가에 가장 가까운 단계.
@freezed
abstract class Orderbook with _$Orderbook {
  const factory Orderbook({
    required List<OrderbookUnit> units,
    required double totalAskSize, // 30호가 전체 매도 잔량
    required double totalBidSize, // 30호가 전체 매수 잔량
  }) = _Orderbook;
}
