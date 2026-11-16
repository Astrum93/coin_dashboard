import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/common/widgets/coin_avatar.dart';
import 'package:coin_dashboard/common/widgets/segmented_pills.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 등락률 상위·하위 5종목 카드. 행을 누르면 상세로 간다.
class MoversCard extends StatelessWidget {
  const MoversCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('등락률 순위', style: AppTextStyles.HEADING),
              ),
              Obx(
                () => SegmentedPills<bool>(
                  options: const {true: '상승', false: '하락'},
                  selected: controller.showRisers.value,
                  onChanged: (v) => controller.showRisers.value = v,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final movers = controller.movers;
            // 카드가 Container 라 물결 효과가 보이도록 투명 Material 을 둔다.
            return Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  for (var i = 0; i < movers.length; i++)
                    InkWell(
                      onTap: () => context.go(
                        AppRoutes.coinDetailPath(movers[i].symbol),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Text(
                                '${i + 1}',
                                style: AppTextStyles.NUMBER_SMALL.copyWith(
                                  color: AppColors.TEXT_MUTED,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            CoinAvatar(symbol: movers[i].symbol),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movers[i].koreanName,
                                    style: AppTextStyles.BODY_STRONG,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    movers[i].symbol,
                                    style: AppTextStyles.CAPTION,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  formatPrice(movers[i].price),
                                  style: AppTextStyles.NUMBER,
                                ),
                                Text(
                                  formatRate(movers[i].changeRate),
                                  style: AppTextStyles.NUMBER_SMALL.copyWith(
                                    color: AppColors.change(
                                      movers[i].changeRate,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
