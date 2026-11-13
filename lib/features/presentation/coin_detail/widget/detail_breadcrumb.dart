import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:coin_dashboard/app/router/app_routes.dart';
import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// '대시보드 / 코인명' 현재 위치 표시.
class DetailBreadcrumb extends StatelessWidget {
  const DetailBreadcrumb({super.key, required this.current});

  final String current;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '현재 위치',
      child: Row(
        children: [
          TextButton(
            onPressed: () => context.go(AppRoutes.home),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.TEXT_MUTED,
              minimumSize: const Size(0, 44),
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
            child: const Text('대시보드', style: AppTextStyles.LABEL),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('/', style: AppTextStyles.CAPTION),
          ),
          Flexible(
            child: Text(
              current,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.LABEL.copyWith(
                color: AppColors.TEXT_PRIMARY,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
