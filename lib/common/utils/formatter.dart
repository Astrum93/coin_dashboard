import 'package:intl/intl.dart';

/// 등락률 표기. 1.823 → "▲ 1.82%", -0.6 → "▼ 0.60%"
String formatRate(double rate) {
  final arrow = rate >= 0 ? '▲' : '▼';
  return '$arrow ${rate.abs().toStringAsFixed(2)}%';
}

/// 원화 가격 표기. 값이 작을수록 소수 자릿수를 늘린다. 0.00123 → "0.00123"
String formatPrice(double value) {
  final abs = value.abs();
  final digits = abs >= 100
      ? 0
      : abs >= 1
      ? 2
      : abs >= 0.01
      ? 4
      : 6;
  return NumberFormat.decimalPatternDigits(
    locale: 'ko_KR',
    decimalDigits: digits,
  ).format(value);
}

/// 큰 원화 금액을 조·억 단위로 줄인다. 4210000000000 → (value: "4.21", unit: "조")
({String value, String unit}) formatKrwCompact(double value) {
  if (value >= 1e12) {
    return (value: (value / 1e12).toStringAsFixed(2), unit: '조');
  }
  if (value >= 1e8) {
    return (
      value: NumberFormat.decimalPattern('ko_KR').format((value / 1e8).round()),
      unit: '억',
    );
  }
  return (
    value: NumberFormat.decimalPattern('ko_KR').format(value.round()),
    unit: '',
  );
}

/// 코인 수량 표기. 1,000 이상은 정수, 미만은 소수 셋째 자리까지. 2787.705 → "2,788"
String formatVolume(double value) {
  return NumberFormat.decimalPatternDigits(
    locale: 'ko_KR',
    decimalDigits: value.abs() >= 1000 ? 0 : 3,
  ).format(value);
}
