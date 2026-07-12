import 'package:freezed_annotation/freezed_annotation.dart';

// build_runner가 생성하는 파일. (dart run build_runner build 로 만들어짐)
part 'coin.freezed.dart';

/// 코인 엔티티 — 앱이 다루는 "순수한" 코인 개념.
///
/// @freezed 를 붙이면 불변성 · == · copyWith · toString 이 자동 생성된다.
/// domain 레이어라 freezed_annotation(순수 Dart)만 의존하고, Flutter/http 는 쓰지 않는다.
@freezed
abstract class Coin with _$Coin {
  const factory Coin({
    required String id, // CoinGecko id, 예: 'bitcoin'
    required String symbol, // 표시용 심볼, 예: 'BTC'
    required int priceKrw, // 원화 가격
  }) = _Coin;
}
