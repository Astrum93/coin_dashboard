import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_theme.dart';

/// 대시보드 카드. 표처럼 가장자리까지 채울 땐 padding 을 EdgeInsets.zero 로.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.SURFACE,
        borderRadius: BorderRadius.circular(AppTheme.RADIUS_CARD),
        border: Border.all(color: AppColors.BORDER),
      ),
      child: child,
    );
  }
}
