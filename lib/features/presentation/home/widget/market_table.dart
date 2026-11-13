import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/app_icon_button.dart';
import 'package:coin_dashboard/common/widgets/change_badge.dart';
import 'package:coin_dashboard/common/widgets/coin_avatar.dart';
import 'package:coin_dashboard/common/widgets/segmented_pills.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 원화 마켓 시세 표. 좁은 화면에선 가로로 스크롤된다.
class MarketTable extends StatelessWidget {
  const MarketTable({super.key});

  static const double _minWidth = 720;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                const Text('원화 마켓', style: AppTextStyles.HEADING),
                Obx(
                  () => SegmentedPills<MarketFilter>(
                    variant: PillVariant.pill,
                    options: {
                      for (final f in MarketFilter.values)
                        f: '${f.label} ${controller.countFor(f)}',
                    },
                    selected: controller.filter.value,
                    onChanged: controller.changeFilter,
                  ),
                ),
                const Text('거래대금순', style: AppTextStyles.CAPTION),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: math.max(constraints.maxWidth, _minWidth),
                child: Obx(() {
                  final all = controller.filteredTickers;
                  final visible = all
                      .take(controller.visibleCount.value)
                      .toList();
                  final favorites = controller.favorites.toSet();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _HeaderRow(),
                      for (final t in visible)
                        _TickerRow(
                          ticker: t,
                          isFavorite: favorites.contains(t.market),
                          onToggleFavorite: () =>
                              controller.toggleFavorite(t.market),
                        ),
                      if (all.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 48),
                          child: Text(
                            '조건에 맞는 코인이 없습니다.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.CAPTION,
                          ),
                        ),
                      if (visible.length < all.length)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: TextButton(
                              onPressed: controller.showMore,
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.TEXT_PRIMARY,
                                minimumSize: const Size(0, 44),
                              ),
                              child: Text(
                                '더 보기 (${visible.length} / ${all.length})',
                                style: AppTextStyles.LABEL,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 열 너비 비율. 헤더와 행이 같이 쓴다.
const List<int> _flex = [22, 13, 12, 11];
const double _favoriteWidth = 52;

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    Widget cell(int i, String text, TextAlign align) => Expanded(
      flex: _flex[i],
      child: Text(text, textAlign: align, style: AppTextStyles.CAPTION),
    );

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.SURFACE_SUNKEN,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.BORDER),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          cell(0, '코인', TextAlign.left),
          cell(1, '현재가', TextAlign.right),
          cell(2, '전일 대비', TextAlign.right),
          cell(3, '거래대금(24h)', TextAlign.right),
          const SizedBox(
            width: _favoriteWidth,
            child: Text(
              '관심',
              textAlign: TextAlign.center,
              style: AppTextStyles.CAPTION,
            ),
          ),
        ],
      ),
    );
  }
}

class _TickerRow extends StatelessWidget {
  const _TickerRow({
    required this.ticker,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final MarketTicker ticker;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.change(ticker.changeRate);
    final volume = formatKrwCompact(ticker.tradePrice24h);
    final sign = ticker.changePrice >= 0 ? '+' : '-';

    return Container(
      constraints: const BoxConstraints(minHeight: 64),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.DIVIDER)),
      ),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            flex: _flex[0],
            child: Row(
              children: [
                CoinAvatar(symbol: ticker.symbol),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticker.koreanName,
                        style: AppTextStyles.BODY_STRONG,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${ticker.symbol}/KRW',
                        style: AppTextStyles.CAPTION,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: _flex[1],
            child: Text(
              formatPrice(ticker.price),
              textAlign: TextAlign.right,
              style: AppTextStyles.NUMBER.copyWith(color: color),
            ),
          ),
          Expanded(
            flex: _flex[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ChangeBadge(rate: ticker.changeRate),
                const SizedBox(height: 2),
                Text(
                  '$sign${formatPrice(ticker.changePrice.abs())}',
                  style: AppTextStyles.NUMBER_SMALL.copyWith(
                    color: AppColors.TEXT_MUTED,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: _flex[3],
            child: Text(
              '${volume.value}${volume.unit}',
              textAlign: TextAlign.right,
              style: AppTextStyles.NUMBER,
            ),
          ),
          SizedBox(
            width: _favoriteWidth,
            child: Center(
              child: FavoriteButton(
                isFavorite: isFavorite,
                onPressed: onToggleFavorite,
                bordered: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
