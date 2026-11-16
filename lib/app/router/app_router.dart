import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/binding/coin_detail_binding.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/screen/coin_detail_screen.dart';
import 'package:coin_dashboard/features/presentation/home/binding/home_binding.dart';
import 'package:coin_dashboard/features/presentation/home/screen/home_screen.dart';

/// 루트 Navigator 키. main 에서 Get.addKey 로 GetX 에도 등록한다.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// 라우트 정의. 화면별 바인딩은 각 GoRoute builder 에서 건다.
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        HomeBinding().dependencies();
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: AppRoutes.coinDetail,
          builder: (context, state) {
            final symbol = (state.pathParameters['symbol'] ?? '').toUpperCase();
            CoinDetailBinding(symbol).dependencies();
            return CoinDetailScreen(symbol: symbol);
          },
        ),
      ],
    ),
  ],
);
