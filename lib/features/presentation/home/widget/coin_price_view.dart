import 'package:flutter/material.dart';

import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';

/// 코인 심볼 + 원화 가격 표시 위젯.
class CoinPriceView extends StatelessWidget {
  const CoinPriceView({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(coin.symbol, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 8),
        Text(
          '₩ ${formatKrw(coin.priceKrw)}',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
