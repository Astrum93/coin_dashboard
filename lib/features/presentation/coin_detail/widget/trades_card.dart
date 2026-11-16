import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/features/domain/entities/trade.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 최근 체결 목록 카드.
class TradesCard extends StatelessWidget {
  const TradesCard({super.key, required this.tag});

  /// 컨트롤러 tag (심볼).
  final String tag;

  /// 열 너비 비율. 헤더와 행이 같이 쓴다.
  static const List<int> _flex = [10, 14, 12, 6];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Row(
              children: [
                const Expanded(
                  child: Text('최근 체결', style: AppTextStyles.HEADING),
                ),
                Obx(
                  () => Text(
                    '최근 ${controller.trades.length}건',
                    style: AppTextStyles.CAPTION,
                  ),
                ),
              ],
            ),
          ),
          _HeaderRow(symbol: tag),
          Obx(() {
            final trades = controller.trades.toList();
            if (trades.isEmpty) {
              final message = controller.depthError.value;
              return SizedBox(
                height: 200,
                child: Center(
                  child: message == null
                      ? const CircularProgressIndicator()
                      : Text(message, style: AppTextStyles.CAPTION),
                ),
              );
            }
            final prevClose = controller.detail.value?.prevClosingPrice;
            return Column(
              children: [
                for (final t in trades)
                  _TradeRow(trade: t, prevClose: prevClose),
              ],
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    Widget cell(int i, String text, TextAlign align) => Expanded(
      flex: TradesCard._flex[i],
      child: Text(text, textAlign: align, style: AppTextStyles.CAPTION),
    );

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.SURFACE_SUNKEN,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.BORDER),
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          cell(0, '체결 시각', TextAlign.left),
          cell(1, '체결가', TextAlign.right),
          cell(2, '체결량($symbol)', TextAlign.right),
          cell(3, '구분', TextAlign.right),
        ],
      ),
    );
  }
}

class _TradeRow extends StatelessWidget {
  const _TradeRow({required this.trade, required this.prevClose});

  final Trade trade;
  final double? prevClose;

  static final DateFormat _time = DateFormat('HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final sideColor = trade.isBuy ? AppColors.RISE : AppColors.FALL;
    final close = prevClose;
    final priceColor = close == null || trade.price == close
        ? AppColors.TEXT_PRIMARY
        : AppColors.change(trade.price - close);
    final numberStyle = AppTextStyles.NUMBER.copyWith(fontSize: 13);

    Widget cell(int i, Widget child) =>
        Expanded(flex: TradesCard._flex[i], child: child);

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.DIVIDER)),
      ),
      child: Row(
        spacing: 12,
        children: [
          cell(
            0,
            Text(
              _time.format(trade.time),
              style: numberStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.TEXT_MUTED,
              ),
            ),
          ),
          cell(
            1,
            Text(
              formatPrice(trade.price),
              textAlign: TextAlign.right,
              style: numberStyle.copyWith(color: priceColor),
            ),
          ),
          cell(
            2,
            Text(
              formatVolume(trade.volume),
              textAlign: TextAlign.right,
              style: numberStyle.copyWith(color: sideColor),
            ),
          ),
          cell(
            3,
            Text(
              trade.isBuy ? '매수' : '매도',
              textAlign: TextAlign.right,
              style: AppTextStyles.LABEL.copyWith(color: sideColor),
            ),
          ),
        ],
      ),
    );
  }
}
