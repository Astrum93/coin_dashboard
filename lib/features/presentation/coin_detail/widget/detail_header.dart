import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_icon_button.dart';
import 'package:coin_dashboard/common/widgets/change_badge.dart';
import 'package:coin_dashboard/common/widgets/coin_avatar.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 코인 이름·관심 토글·현재가·전일 대비.
class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.detail, required this.tag});

  final CoinDetail detail;

  /// 컨트롤러 tag (심볼).
  final String tag;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);
    final sign = detail.changePrice >= 0 ? '+' : '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          children: [
            CoinAvatar(symbol: detail.symbol, size: 48),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 4,
                    children: [
                      Text(
                        detail.koreanName,
                        style: AppTextStyles.TITLE,
                        overflow: TextOverflow.ellipsis,
                      ),
                      _Chip(text: '${detail.symbol}/KRW'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '업비트 원화 마켓 · ${detail.market}',
                    style: AppTextStyles.CAPTION,
                  ),
                ],
              ),
            ),
            Obx(
              () => FavoriteButton(
                isFavorite: controller.isFavorite,
                onPressed: controller.toggleFavorite,
              ),
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  formatPrice(detail.price),
                  style: AppTextStyles.PRICE_DISPLAY,
                ),
                const SizedBox(width: 8),
                Text(
                  'KRW',
                  style: AppTextStyles.CAPTION.copyWith(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                ChangeBadge(rate: detail.changeRate),
                Text(
                  '$sign${formatPrice(detail.changePrice.abs())}',
                  style: AppTextStyles.NUMBER.copyWith(
                    color: AppColors.change(detail.changeRate),
                  ),
                ),
                const Text('전일 대비', style: AppTextStyles.CAPTION),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.SURFACE_RAISED,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.BORDER),
      ),
      child: Text(text, style: AppTextStyles.NUMBER_SMALL),
    );
  }
}
