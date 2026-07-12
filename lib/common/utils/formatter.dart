// 숫자·통화 포맷 관련 유틸.

/// 95000000 -> "95,000,000" 처럼 천 단위 쉼표를 넣어준다.
String formatKrw(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return buffer.toString();
}
