import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/widgets/app_icon_button.dart';
import 'package:coin_dashboard/common/widgets/app_search_field.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 홈 상단. 제목·갱신 시각, 검색창, 새로고침 버튼.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return LayoutBuilder(
      builder: (context, constraints) => Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('대시보드', style: AppTextStyles.TITLE),
              const SizedBox(height: 6),
              Obx(() {
                final error = controller.error.value;
                if (error != null) {
                  return Text(
                    error,
                    style: AppTextStyles.CAPTION.copyWith(
                      color: AppColors.RISE,
                    ),
                  );
                }
                final at = controller.updatedAt.value;
                return Text(
                  at == null
                      ? '원화(KRW) 마켓'
                      : '원화(KRW) 마켓 · 마지막 갱신 ${DateFormat('HH:mm:ss').format(at)}',
                  style: AppTextStyles.CAPTION.copyWith(fontSize: 13),
                );
              }),
            ],
          ),
          SizedBox(
            width: math.min(420, constraints.maxWidth),
            child: Row(
              children: [
                Expanded(
                  child: AppSearchField(onChanged: controller.changeQuery),
                ),
                const SizedBox(width: 10),
                Obx(
                  () => AppIconButton(
                    icon: Icons.refresh_rounded,
                    tooltip: '시세 새로고침',
                    onPressed: controller.loading.value
                        ? null
                        : controller.refreshAll,
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
