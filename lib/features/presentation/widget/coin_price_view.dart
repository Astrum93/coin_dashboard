import 'package:flutter/material.dart';

import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';

/// 코인 하나의 심볼 + 원화 가격을 보여주는 표시용 위젯.
///
/// 화면(screen)에서 이 조각을 떼어내면, 나중에 목록(2단계)에서
/// 여러 코인에 같은 위젯을 재사용할 수 있다.
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
