import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/app_routes.dart';
import 'package:coin_dashboard/features/presentation/screen/home_screen.dart';

/// go_router 설정 — "어떤 URL이 어떤 화면을 보여줄지" 선언한다.
/// 웹에서는 이 규칙이 곧 주소창과 연결되고, 딥링크도 이 규칙을 따라 열린다.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
