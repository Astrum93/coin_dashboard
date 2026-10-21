import 'package:flutter/material.dart';

/// 코인 로고 자리. 심볼 첫 글자를 원 안에 표시한다.
class CoinAvatar extends StatelessWidget {
  const CoinAvatar({super.key, required this.symbol, this.size = 32});

  final String symbol;
  final double size;

  static const Map<String, Color> _tints = {
    'BTC': Color(0xFFF7931A),
    'ETH': Color(0xFF627EEA),
    'XRP': Color(0xFF4B5563),
    'SOL': Color(0xFF7B4FE0),
    'DOGE': Color(0xFFA88B1E),
    'ADA': Color(0xFF2F5BD3),
    'AVAX': Color(0xFFD0383A),
    'LINK': Color(0xFF2A5ADA),
  };

  static const List<Color> _fallback = [
    Color(0xFF3F6E8C),
    Color(0xFF6B4F8C),
    Color(0xFF8C5A3F),
    Color(0xFF3F8C6B),
  ];

  @override
  Widget build(BuildContext context) {
    final tint =
        _tints[symbol] ??
        _fallback[symbol.codeUnits.fold<int>(0, (a, b) => a + b) %
            _fallback.length];

    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: tint, shape: BoxShape.circle),
        child: Text(
          symbol.isEmpty ? '?' : symbol[0],
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
