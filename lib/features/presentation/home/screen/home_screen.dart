import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';
import 'package:coin_dashboard/features/presentation/home/widget/coin_price_view.dart';

/// 홈 화면. 상세 이동 버튼은 상세 라우트를 열 때 주석 해제.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('코인 대시보드'),
      ),
      body: Center(
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
              // const SizedBox(height: 32),
              // ElevatedButton(
              //   onPressed: () {
              //     Get.snackbar('이동', '${coin.symbol} 상세로 이동합니다',
              //         snackPosition: SnackPosition.BOTTOM);
              //     context.go(AppRoutes.coinDetailPath(coin.symbol));
              //   },
              //   child: Text('${coin.symbol} 상세 보기 →'),
              // ),
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
