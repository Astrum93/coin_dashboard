import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/segmented_pills.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/widget/candle_chart_painter.dart';

/// 캔들/라인 전환과 기간 선택이 있는 가격 차트 카드.
class CandleChartCard extends StatelessWidget {
  const CandleChartCard({super.key, required this.tag});

  /// 컨트롤러 tag (심볼).
  final String tag;

  static const double _height = 400;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () => Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 12,
              runSpacing: 12,
              children: [
                SegmentedPills<ChartMode>(
                  options: {for (final m in ChartMode.values) m: m.label},
                  selected: controller.mode.value,
                  onChanged: controller.changeMode,
                ),
                SegmentedPills<DetailPeriod>(
                  options: {for (final p in DetailPeriod.values) p: p.label},
                  selected: controller.period.value,
                  onChanged: controller.changePeriod,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            final candles = controller.candles.toList();
            final chartError = controller.chartError.value;
            if (candles.isEmpty) {
              return SizedBox(
                height: _height,
                child: Center(
                  child: chartError != null
                      ? Text(chartError, style: AppTextStyles.CAPTION)
                      : const CircularProgressIndicator(),
                ),
              );
            }

            final period = controller.period.value;
            final mode = controller.mode.value;
            final name = controller.detail.value?.koreanName ?? tag;
            return Semantics(
              label: '$name ${period.label} ${mode.label} 차트',
              child: AnimatedOpacity(
                opacity: controller.chartLoading.value ? 0.4 : 1,
                duration: const Duration(milliseconds: 150),
                child: CustomPaint(
                  size: const Size(double.infinity, _height),
                  painter: CandleChartPainter(
                    candles: candles,
                    mode: mode,
                    timePattern: _timePattern(period),
                    currentPrice: controller.detail.value?.price,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  static String _timePattern(DetailPeriod period) => switch (period) {
    DetailPeriod.minutes15 => 'HH:mm',
    DetailPeriod.hour1 || DetailPeriod.hour4 => 'M/d HH시',
    DetailPeriod.day => 'M/d',
    DetailPeriod.year => 'yy.MM',
  };
}
