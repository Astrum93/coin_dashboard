import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/app_licenses.dart';
import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/app/theme/app_breakpoints.dart';
import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/widgets/dashboard_shell.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/candle_chart_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/day_stats_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/detail_breadcrumb.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/detail_header.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/news_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/official_links_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/orderbook_card.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/trades_card.dart';
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
            onTap: () => showAppInfo(context),
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
      if (controller.notFound.value) {
        return _NotFound(symbol: symbol);
      }
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

          final chart = CandleChartCard(tag: symbol);
          final stats = DayStatsCard(detail: detail);
          final orderbook = OrderbookCard(tag: symbol);
          final trades = TradesCard(tag: symbol);
          final news = NewsCard(tag: symbol);
          final links = OfficialLinksCard(tag: symbol);

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
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16,
                          children: [chart, trades, news],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16,
                          children: [stats, orderbook, links],
                        ),
                      ),
                    ],
                  )
                else ...[
                  chart,
                  stats,
                  orderbook,
                  trades,
                  news,
                  links,
                ],
              ],
            ),
          );
        },
      );
    });
  }
}

/// 업비트 원화 마켓에 없는 심볼로 들어왔을 때.
class _NotFound extends StatelessWidget {
  const _NotFound({required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 40,
              color: AppColors.TEXT_MUTED,
            ),
            Text(
              '업비트 원화 마켓에 \'$symbol\' 코인이 없어요.',
              textAlign: TextAlign.center,
              style: AppTextStyles.BODY_STRONG,
            ),
            const Text(
              '주소를 확인하거나 홈의 원화 마켓에서 코인을 골라 주세요.',
              textAlign: TextAlign.center,
              style: AppTextStyles.CAPTION,
            ),
            OutlinedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('홈으로'),
            ),
          ],
        ),
      ),
    );
  }
}
