import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';

/// 등락률 배지. 예: "▲ 1.82%" (상승 빨강, 하락 파랑)
class ChangeBadge extends StatelessWidget {
  const ChangeBadge({super.key, required this.rate, this.suffix});

  /// 퍼센트 단위. 1.82 = 1.82%
  final double rate;

  /// 뒤에 붙일 말. 예: '1일'
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.change(rate);
    final text = suffix == null
        ? formatRate(rate)
        : '${formatRate(rate)} · $suffix';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: AppTextStyles.NUMBER_SMALL.copyWith(color: color),
      ),
    );
  }
}
