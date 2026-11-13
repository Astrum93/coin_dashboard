import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_breakpoints.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/widgets/dashboard_shell.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';
import 'package:coin_dashboard/features/presentation/home/widget/home_header.dart';
import 'package:coin_dashboard/features/presentation/home/widget/market_summary.dart';
import 'package:coin_dashboard/features/presentation/home/widget/market_table.dart';
import 'package:coin_dashboard/features/presentation/home/widget/movers_card.dart';
import 'package:coin_dashboard/features/presentation/home/widget/price_chart_card.dart';

/// 홈 대시보드 화면.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final active = controller.activeNav;
      return DashboardShell(
        connected: controller.error.value == null,
        navItems: [
          ShellNavItem(
            icon: Icons.dashboard_rounded,
            label: '대시보드',
            selected: active == HomeNav.dashboard,
            onTap: controller.scrollToTop,
          ),
          ShellNavItem(
            icon: Icons.format_list_bulleted_rounded,
            label: '원화 마켓',
            selected: active == HomeNav.markets,
            onTap: () =>
                controller.scrollToMarkets(withFilter: MarketFilter.all),
          ),
          ShellNavItem(
            icon: Icons.star_outline_rounded,
            label: '관심 코인',
            selected: active == HomeNav.favorites,
            onTap: () =>
                controller.scrollToMarkets(withFilter: MarketFilter.favorite),
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
        child: const _HomeBody(),
      );
    });
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.tickers.isEmpty) {
        final error = controller.error.value;
        if (error == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error, style: AppTextStyles.CAPTION),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: controller.fetch,
                child: const Text('다시 시도'),
              ),
            ],
          ),
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= AppBreakpoints.DESKTOP;
          final gutter = constraints.maxWidth >= AppBreakpoints.TABLET
              ? 32.0
              : 16.0;

          return SingleChildScrollView(
            controller: controller.scrollController,
            padding: EdgeInsets.fromLTRB(gutter, 28, gutter, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                const HomeHeader(),
                const MarketSummary(),
                if (wide)
                  const IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
                      children: [
                        Expanded(flex: 2, child: PriceChartCard()),
                        Expanded(child: MoversCard()),
                      ],
                    ),
                  )
                else ...[
                  const PriceChartCard(),
                  const MoversCard(),
                ],
                MarketTable(key: controller.marketSectionKey),
              ],
            ),
          );
        },
      );
    });
  }
}
