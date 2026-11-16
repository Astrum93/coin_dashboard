import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade.freezed.dart';

/// 체결 한 건.
@freezed
abstract class Trade with _$Trade {
  const factory Trade({
    required int id, // 업비트 sequential_id
    required DateTime time,
    required double price,
    required double volume,
    required bool isBuy, // 매수 주문이 체결시킨 거래
  }) = _Trade;
}
