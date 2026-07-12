import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/app_routes.dart';
import 'package:coin_dashboard/features/presentation/screen/coin_detail_screen.dart';
import 'package:coin_dashboard/features/presentation/screen/home_screen.dart';

/// 앱 루트 Navigator의 키.
/// go_router가 이 키로 최상위 Navigator를 만들고, main 에서 이 키를 GetX에도
/// 등록한다(Get.addKey). 그래야 Get.snackbar / Get.dialog 가 이 Navigator의
/// 오버레이를 찾을 수 있다. (안 하면 Get.key 가 빈 키라 오버레이 null 크래시)
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// go_router 설정 — "어떤 URL이 어떤 화면을 보여줄지" 선언한다.
/// 웹에서는 이 규칙이 곧 주소창과 연결되고, 딥링크도 이 규칙을 따라 열린다.
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.coinDetail,
      builder: (context, state) {
        // URL의 :symbol 부분을 꺼낸다. 예) /coin/BTC → 'BTC'
        final symbol = state.pathParameters['symbol'] ?? '';
        return CoinDetailScreen(symbol: symbol);
      },
    ),
  ],
);
