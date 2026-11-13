import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/app/theme/app_breakpoints.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/dashboard_shell.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/day_stats_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/detail_breadcrumb.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/detail_header.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 코인 상세 화면. [symbol] 은 URL 의 :symbol (대문자).
class CoinDetailScreen extends StatefulWidget {
  const CoinDetailScreen({super.key, required this.symbol});

  final String symbol;

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  /// go_router 는 GetX 라우트 관리를 거치지 않아 화면이 사라질 때 직접 지운다.
  @override
  void dispose() {
    Get.delete<CoinDetailController>(tag: widget.symbol);
    super.dispose();
  }

  /// 홈으로 돌아가 원화 마켓 표로 스크롤한다.
  void _goToMarkets(MarketFilter filter) {
    context.go(AppRoutes.home);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Get.find<HomeController>().scrollToMarkets(withFilter: filter),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: widget.symbol);

    return Obx(
      () => DashboardShell(
        connected: controller.error.value == null,
        navItems: [
          ShellNavItem(
            icon: Icons.dashboard_rounded,
            label: '대시보드',
            onTap: () => context.go(AppRoutes.home),
          ),
          ShellNavItem(
            icon: Icons.format_list_bulleted_rounded,
            label: '원화 마켓',
            onTap: () => _goToMarkets(MarketFilter.all),
          ),
          ShellNavItem(
            icon: Icons.star_outline_rounded,
            label: '관심 코인',
            onTap: () => _goToMarkets(MarketFilter.favorite),
          ),
          ShellNavItem(
            icon: Icons.info_outline_rounded,
            label: '정보',
            onTap: () => showLicensePage(
              context: context,
              applicationName: '코인 대시보드',
              applicationLegalese: '시세 데이터: 업비트 공개 API',
            ),
          ),
        ],
        child: _DetailBody(symbol: widget.symbol),
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: symbol);

    return Obx(() {
      final detail = controller.detail.value;
      if (detail == null) {
        final error = controller.error.value;
        if (error == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.CAPTION,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    OutlinedButton(
                      onPressed: controller.fetch,
                      child: const Text('다시 시도'),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.home),
                      child: const Text('홈으로'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= AppBreakpoints.DESKTOP;
          final gutter = constraints.maxWidth >= AppBreakpoints.TABLET
              ? 32.0
              : 16.0;

          // 3단계부터 차트·체결 카드로 채운다.
          const main = <Widget>[
            AppCard(
              child: Text(
                '차트·호가·체결은 다음 단계에서 채웁니다.',
                style: AppTextStyles.CAPTION,
              ),
            ),
          ];
          final side = <Widget>[DayStatsCard(detail: detail)];

          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(gutter, 20, gutter, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                DetailBreadcrumb(current: detail.koreanName),
                DetailHeader(detail: detail, tag: symbol),
                if (wide)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16,
                          children: main,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16,
                          children: side,
                        ),
                      ),
                    ],
                  )
                else ...[
                  ...main,
                  ...side,
                ],
              ],
            ),
          );
        },
      );
    });
  }
}
