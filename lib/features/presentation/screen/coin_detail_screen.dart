import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/app_routes.dart';

/// 코인 상세 화면 (아직은 골격만 있는 자리표시자).
/// [symbol] 은 URL의 :symbol 부분에서 넘어온다. 예) /coin/BTC → 'BTC'
///
/// 학습 포인트: 웹에서 주소창에 '/coin/BTC'를 직접 쳐서 새로고침해도
/// 이 화면이 바로 열린다 = 딥링크가 동작한다는 뜻.
class CoinDetailScreen extends StatelessWidget {
  const CoinDetailScreen({super.key, required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$symbol 상세'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              symbol,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('상세 화면은 이후 단계에서 채웁니다.'),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('← 홈으로'),
            ),
          ],
        ),
      ),
    );
  }
}
