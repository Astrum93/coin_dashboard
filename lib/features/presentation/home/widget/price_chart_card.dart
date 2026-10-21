import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/change_badge.dart';
import 'package:coin_dashboard/common/widgets/coin_avatar.dart';
import 'package:coin_dashboard/common/widgets/segmented_pills.dart';
import 'package:coin_dashboard/common/widgets/sparkline.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 대표 코인(비트코인) 가격 차트 카드.
class PriceChartCard extends StatelessWidget {
  const PriceChartCard({super.key});

  static const double _chartHeight = 260;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 16,
            runSpacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CoinAvatar(symbol: 'BTC', size: 28),
                      SizedBox(width: 10),
                      Text('비트코인', style: AppTextStyles.bodyStrong),
                      SizedBox(width: 6),
                      Text('BTC/KRW', style: AppTextStyles.caption),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    final btc = controller.featured;
                    final rate = controller.periodChangeRate;
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Text(
                          btc == null ? '-' : formatPrice(btc.price),
                          style: AppTextStyles.priceDisplay,
                        ),
                        Text(
                          'KRW',
                          style: AppTextStyles.caption.copyWith(fontSize: 16),
                        ),
                        if (rate != null)
                          ChangeBadge(
                            rate: rate,
                            suffix: controller.period.value.label,
                          ),
                      ],
                    );
                  }),
                ],
              ),
              Obx(
                () => SegmentedPills<ChartPeriod>(
                  options: {for (final p in ChartPeriod.values) p: p.label},
                  selected: controller.period.value,
                  onChanged: controller.changePeriod,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() {
            final candles = controller.candles.toList();
            final chartError = controller.chartError.value;
            if (candles.isEmpty) {
              return SizedBox(
                height: _chartHeight,
                child: Center(
                  child: chartError != null
                      ? Text(chartError, style: AppTextStyles.caption)
                      : const CircularProgressIndicator(),
                ),
              );
            }
            return _Chart(
              candles: candles,
              period: controller.period.value,
              height: _chartHeight,
            );
          }),
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    required this.candles,
    required this.period,
    required this.height,
  });

  final List<Candle> candles;
  final ChartPeriod period;
  final double height;

  @override
  Widget build(BuildContext context) {
    final closes = candles.map((c) => c.close).toList();
    final high = closes.reduce((a, b) => a > b ? a : b);
    final low = closes.reduce((a, b) => a < b ? a : b);
    final pattern = switch (period) {
      ChartPeriod.day => 'HH:mm',
      ChartPeriod.week || ChartPeriod.month => 'M/d',
      ChartPeriod.year => 'yy.MM',
    };
    // 폰 너비에선 라벨이 겹치지 않게 3개만.
    final count = MediaQuery.sizeOf(context).width < 600 ? 3 : 5;
    final step = (candles.length - 1) / (count - 1);
    final xLabels = [
      for (var i = 0; i < count; i++)
        DateFormat(pattern).format(candles[(i * step).round()].time),
    ];
    final yLabels = [
      for (var i = 0; i < 4; i++) formatPrice(high - (high - low) * i / 3),
    ];
    final axisStyle = AppTextStyles.numberSmall.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.textMuted,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              PriceAreaChart(
                values: closes,
                color: AppColors.accent,
                height: height,
                semanticLabel: '비트코인 ${period.label} 가격 추이 차트',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final x in xLabels)
                    Flexible(
                      child: Text(
                        x,
                        style: axisStyle,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [for (final y in yLabels) Text(y, style: axisStyle)],
          ),
        ),
      ],
    );
  }
}
