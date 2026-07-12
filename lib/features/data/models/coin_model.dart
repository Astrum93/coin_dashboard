import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/coin.dart';

part 'coin_model.freezed.dart';

/// 코인 DTO(Data Transfer Object) — API 응답 모양에 맞춘 데이터 그릇.
///
/// 엔티티(Coin)와 분리하는 이유: API 응답 구조가 바뀌어도 그 변화가
/// 이 파일 안에서 흡수되고, domain(Coin)까지 넘어가지 않도록 막는 방화벽.
///
/// @freezed 로 불변성·==·copyWith 를 자동 생성한다.
/// 커스텀 factory(fromSimplePrice)와 메서드(toEntity)를 함께 두려면
/// 아래처럼 private 생성자 `CoinModel._()` 를 하나 선언해야 한다.
@freezed
abstract class CoinModel with _$CoinModel {
  const CoinModel._();

  const factory CoinModel({
    required String id,
    required String symbol,
    required int priceKrw,
  }) = _CoinModel;

  /// CoinGecko simple/price 응답에서 만든다.
  /// 응답 예시: {"bitcoin": {"krw": 95000000}}
  /// (응답 구조가 특이해서 자동 JSON 대신 손으로 파싱한다)
  factory CoinModel.fromSimplePrice({
    required String id,
    required String symbol,
    required Map<String, dynamic> json,
  }) {
    final krw = (json[id]['krw'] as num).toInt();
    return CoinModel(id: id, symbol: symbol, priceKrw: krw);
  }

  /// DTO → 엔티티 변환(mapper). data 의 형태를 domain 의 형태로 바꾼다.
  Coin toEntity() => Coin(id: id, symbol: symbol, priceKrw: priceKrw);
}
