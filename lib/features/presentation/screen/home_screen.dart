import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/app_routes.dart';
import 'package:coin_dashboard/features/presentation/controller/coin_controller.dart';
import 'package:coin_dashboard/features/presentation/widget/coin_price_view.dart';

/// 홈(시세) 화면. 이제 StatelessWidget 이다 —
/// 상태는 CoinController 가 들고 있고, 화면은 Obx 로 그걸 "구독"만 한다.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 바인딩에서 등록해둔 컨트롤러를 찾아온다. (처음 find 될 때 생성되며 onInit→fetch 실행)
    final controller = Get.find<CoinController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('코인 대시보드'),
      ),
      body: Center(
        // Obx: 안에서 읽는 Rx 값(loading/error/coin)이 바뀌면 이 부분만 다시 그린다.
        child: Obx(() {
          if (controller.loading.value) {
            return const CircularProgressIndicator();
          }
          if (controller.error.value != null) {
            return Text(
              controller.error.value!,
              style: const TextStyle(color: Colors.red),
            );
          }
          final coin = controller.coin.value;
          if (coin == null) {
            return const Text('데이터 없음');
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CoinPriceView(coin: coin),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // GetX 스낵바(오버레이) — go_router를 써도 그대로 동작한다.
                  Get.snackbar('이동', '${coin.symbol} 상세로 이동합니다',
                      snackPosition: SnackPosition.BOTTOM);
                  // go_router로 화면 이동 (웹이면 주소창이 /coin/BTC 로 바뀐다).
                  context.go(AppRoutes.coinDetailPath(coin.symbol));
                },
                child: Text('${coin.symbol} 상세 보기 →'),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: controller.loading.value ? null : controller.fetch,
          tooltip: '새로고침',
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
