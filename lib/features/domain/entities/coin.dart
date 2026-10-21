import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.freezed.dart';

/// 코인 엔티티.
@freezed
abstract class Coin with _$Coin {
  const factory Coin({
    required String id, // 업비트 마켓 코드. 예: 'KRW-BTC'
    required String symbol, // 예: 'BTC'
    required int priceKrw,
  }) = _Coin;
}
