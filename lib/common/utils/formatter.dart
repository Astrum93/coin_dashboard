/// 천 단위 쉼표. 95000000 → "95,000,000"
String formatKrw(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return buffer.toString();
}
