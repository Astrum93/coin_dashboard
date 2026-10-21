import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/change_badge.dart';
import 'package:coin_dashboard/common/widgets/stat_tile.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 시장 요약 카드 4장. 너비에 따라 4 / 2 / 1열.
class MarketSummary extends StatelessWidget {
  const MarketSummary({super.key});

  static const double _gap = 16;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 1000
            ? 4
            : constraints.maxWidth >= 520
            ? 2
            : 1;
        final width = (constraints.maxWidth - _gap * (columns - 1)) / columns;

        return Obx(() {
          final rise = controller.riseCount;
          final fall = controller.fallCount;
          final total = formatKrwCompact(controller.totalTradePrice);
          final btc = controller.featured;
          final favoriteRate = controller.favoriteAverageRate;

          final tiles = [
            StatTile(
              label: '상승 / 하락 종목',
              value: '$rise / $fall',
              footer: _RatioBar(rise: rise, fall: fall),
            ),
            StatTile(
              label: '24시간 거래대금',
              value: total.value,
              unit: '${total.unit} 원',
              footer: Text(
                '원화 마켓 ${controller.tickers.length}종목 합계',
                style: AppTextStyles.caption,
              ),
            ),
            StatTile(
              label: '비트코인 BTC',
              value: btc == null ? '-' : formatPrice(btc.price),
              unit: '원',
              footer: btc == null ? null : ChangeBadge(rate: btc.changeRate),
            ),
            StatTile(
              label: '관심 코인',
              value: '${controller.favorites.length}',
              unit: '개',
              footer: favoriteRate == null
                  ? const Text('표에서 별을 눌러 추가', style: AppTextStyles.caption)
                  : ChangeBadge(rate: favoriteRate, suffix: '평균'),
            ),
          ];

          return Wrap(
            spacing: _gap,
            runSpacing: _gap,
            children: [
              for (final tile in tiles) SizedBox(width: width, child: tile),
            ],
          );
        });
      },
    );
  }
}

/// 상승·하락 종목 비율 막대.
class _RatioBar extends StatelessWidget {
  const _RatioBar({required this.rise, required this.fall});

  final int rise;
  final int fall;

  @override
  Widget build(BuildContext context) {
    if (rise + fall == 0) {
      return const SizedBox(height: 6);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SizedBox(
        height: 6,
        child: Row(
          spacing: 2,
          children: [
            if (rise > 0)
              Expanded(
                flex: rise,
                child: const ColoredBox(color: AppColors.rise),
              ),
            if (fall > 0)
              Expanded(
                flex: fall,
                child: const ColoredBox(color: AppColors.fall),
              ),
          ],
        ),
      ),
    );
  }
}
