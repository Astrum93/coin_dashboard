import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/router/app_routes.dart';

/// 코인 상세 화면 (골격만). [symbol] 은 URL 의 :symbol.
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
