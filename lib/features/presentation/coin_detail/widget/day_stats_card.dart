import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';

/// 당일 저가~고가 범위와 주요 시세 수치 카드.
class DayStatsCard extends StatelessWidget {
  const DayStatsCard({super.key, required this.detail});

  final CoinDetail detail;

  @override
  Widget build(BuildContext context) {
    final tradePrice = formatKrwCompact(detail.tradePrice24h);
    final stats = [
      ('전일 종가', formatPrice(detail.prevClosingPrice)),
      ('시가', formatPrice(detail.openingPrice)),
      ('거래량(24h)', '${formatVolume(detail.tradeVolume24h)} ${detail.symbol}'),
      ('거래대금(24h)', '${tradePrice.value}${tradePrice.unit}'),
      ('52주 최고', formatPrice(detail.highest52WeekPrice)),
      ('52주 최저', formatPrice(detail.lowest52WeekPrice)),
    ];

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('시세 요약', style: AppTextStyles.HEADING),
          const SizedBox(height: 20),
          _DayRange(detail: detail),
          const SizedBox(height: 20),
          const Divider(height: 1, color: AppColors.DIVIDER),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 300 ? 2 : 1;
              return Wrap(
                runSpacing: 16,
                children: [
                  for (final (label, value) in stats)
                    SizedBox(
                      width: constraints.maxWidth / columns,
                      child: _Stat(label: label, value: value),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// 당일 저가~고가 막대 위에 현재가 위치를 표시한다.
class _DayRange extends StatelessWidget {
  const _DayRange({required this.detail});

  final CoinDetail detail;

  @override
  Widget build(BuildContext context) {
    final span = detail.highPrice - detail.lowPrice;
    final ratio = span <= 0
        ? 0.5
        : ((detail.price - detail.lowPrice) / span).clamp(0.0, 1.0);
    final numberStyle = AppTextStyles.NUMBER.copyWith(fontSize: 13);

    return Semantics(
      label:
          '당일 저가 ${formatPrice(detail.lowPrice)}, '
          '고가 ${formatPrice(detail.highPrice)}, '
          '현재가 ${formatPrice(detail.price)}',
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('당일 저가', style: AppTextStyles.CAPTION),
                Text('당일 고가', style: AppTextStyles.CAPTION),
              ],
            ),
            SizedBox(
              height: 14,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const markerWidth = 3.0;
                  final left = (constraints.maxWidth - markerWidth) * ratio;
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.SURFACE_RAISED,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      Container(
                        width: left + markerWidth,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.change(
                            detail.changeRate,
                          ).withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      Positioned(
                        left: left,
                        child: Container(
                          width: markerWidth,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.TEXT_PRIMARY,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatPrice(detail.lowPrice),
                  style: numberStyle.copyWith(color: AppColors.FALL),
                ),
                Text(
                  formatPrice(detail.highPrice),
                  style: numberStyle.copyWith(color: AppColors.RISE),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(label, style: AppTextStyles.CAPTION),
          Text(
            value,
            style: AppTextStyles.NUMBER,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
