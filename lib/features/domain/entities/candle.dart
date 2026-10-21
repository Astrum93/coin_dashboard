import 'package:freezed_annotation/freezed_annotation.dart';

part 'candle.freezed.dart';

/// 캔들 단위.
enum CandleUnit { minutes30, minutes240, days, weeks }

/// 캔들 한 개. time 은 KST 기준 시작 시각.
@freezed
abstract class Candle with _$Candle {
  const factory Candle({
    required DateTime time,
    required double open,
    required double high,
    required double low,
    required double close,
    required double volume,
  }) = _Candle;
}
