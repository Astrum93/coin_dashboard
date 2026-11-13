import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/change_badge.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/entities/orderbook.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 매도·매수 5호가와 잔량 막대 카드.
class OrderbookCard extends StatelessWidget {
  const OrderbookCard({super.key, required this.tag});

  /// 컨트롤러 tag (심볼).
  final String tag;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Expanded(child: Text('호가', style: AppTextStyles.HEADING)),
              Text('수량 $tag', style: AppTextStyles.CAPTION),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final book = controller.orderbook.value;
            final detail = controller.detail.value;
            if (book == null || detail == null) {
              return _Placeholder(message: controller.depthError.value);
            }
            return _Book(book: book, detail: detail);
          }),
        ],
      ),
    );
  }
}

class _Book extends StatelessWidget {
  const _Book({required this.book, required this.detail});

  final Orderbook book;
  final CoinDetail detail;

  @override
  Widget build(BuildContext context) {
    final units = book.units;
    final maxSize = [
      for (final u in units) ...[u.askSize, u.bidSize],
    ].fold<double>(0, (a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final u in units.reversed)
          _Row(
            price: u.askPrice,
            size: u.askSize,
            ratio: maxSize == 0 ? 0 : u.askSize / maxSize,
            barColor: AppColors.FALL,
            prevClose: detail.prevClosingPrice,
          ),
        Container(
          height: 44,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.SURFACE_RAISED,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            spacing: 8,
            children: [
              Text(
                formatPrice(detail.price),
                style: AppTextStyles.NUMBER.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.change(detail.changeRate),
                ),
              ),
              ChangeBadge(rate: detail.changeRate),
              const Spacer(),
              const Text('현재가', style: AppTextStyles.CAPTION),
            ],
          ),
        ),
        for (final u in units)
          _Row(
            price: u.bidPrice,
            size: u.bidSize,
            ratio: maxSize == 0 ? 0 : u.bidSize / maxSize,
            barColor: AppColors.RISE,
            prevClose: detail.prevClosingPrice,
          ),
        const SizedBox(height: 12),
        const Divider(height: 1, color: AppColors.DIVIDER),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _Total(
                label: '매도 잔량',
                value: book.totalAskSize,
                color: AppColors.FALL,
              ),
            ),
            Expanded(
              child: _Total(
                label: '매수 잔량',
                value: book.totalBidSize,
                color: AppColors.RISE,
                alignEnd: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          '잔량 합계는 30호가 기준',
          textAlign: TextAlign.center,
          style: AppTextStyles.CAPTION,
        ),
      ],
    );
  }
}

/// 호가 한 줄. 잔량 비율만큼 오른쪽부터 막대를 채운다.
class _Row extends StatelessWidget {
  const _Row({
    required this.price,
    required this.size,
    required this.ratio,
    required this.barColor,
    required this.prevClose,
  });

  final double price;
  final double size;
  final double ratio;
  final Color barColor;
  final double prevClose;

  @override
  Widget build(BuildContext context) {
    final priceColor = price == prevClose
        ? AppColors.TEXT_PRIMARY
        : AppColors.change(price - prevClose);

    return SizedBox(
      height: 32,
      child: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.centerRight,
              widthFactor: ratio,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: barColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  formatPrice(price),
                  style: AppTextStyles.NUMBER.copyWith(
                    fontSize: 13,
                    color: priceColor,
                  ),
                ),
                const Spacer(),
                Text(
                  formatVolume(size),
                  style: AppTextStyles.NUMBER.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.TEXT_MUTED,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({
    required this.label,
    required this.value,
    required this.color,
    this.alignEnd = false,
  });

  final String label;
  final double value;
  final Color color;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(label, style: AppTextStyles.CAPTION),
        Text(
          formatVolume(value),
          style: AppTextStyles.NUMBER.copyWith(color: color),
        ),
      ],
    );
  }
}

/// 첫 응답 전 로딩, 실패 시 메시지.
class _Placeholder extends StatelessWidget {
  const _Placeholder({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: message == null
            ? const CircularProgressIndicator()
            : Text(
                message!,
                textAlign: TextAlign.center,
                style: AppTextStyles.CAPTION,
              ),
      ),
    );
  }
}
