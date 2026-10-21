import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/coin.dart';

part 'coin_model.freezed.dart';

/// 코인 DTO. 커스텀 factory/메서드를 두려면 private 생성자가 필요하다.
@freezed
abstract class CoinModel with _$CoinModel {
  const CoinModel._();

  const factory CoinModel({
    required String id,
    required String symbol,
    required int priceKrw,
  }) = _CoinModel;

  /// 업비트 ticker 한 건 파싱. 예: {"market": "KRW-BTC", "trade_price": 95000000.0}
  factory CoinModel.fromTicker({
    required String symbol,
    required Map<String, dynamic> json,
  }) {
    return CoinModel(
      id: json['market'] as String,
      symbol: symbol,
      priceKrw: (json['trade_price'] as num).toInt(),
    );
  }

  /// DTO → 엔티티.
  Coin toEntity() => Coin(id: id, symbol: symbol, priceKrw: priceKrw);
}
