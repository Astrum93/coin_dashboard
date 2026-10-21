import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// 선택 표시 방식. segment = 차트 기간 같은 묶음 토글, pill = 마켓 필터 같은 강조 칩.
enum PillVariant { segment, pill }

/// 하나만 고르는 알약형 선택지. 예: 1일 / 1주 / 1개월 / 1년
class SegmentedPills<T> extends StatelessWidget {
  const SegmentedPills({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.variant = PillVariant.segment,
  });

  /// 값 → 표시 이름. 순서대로 그린다.
  final Map<T, String> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final PillVariant variant;

  @override
  Widget build(BuildContext context) {
    final items = [
      for (final entry in options.entries)
        _PillButton(
          label: entry.value,
          selected: entry.key == selected,
          variant: variant,
          onTap: () => onChanged(entry.key),
        ),
    ];

    if (variant == PillVariant.pill) {
      return Wrap(spacing: 4, runSpacing: 4, children: items);
    }
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, spacing: 4, children: items),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.label,
    required this.selected,
    required this.variant,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final PillVariant variant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isPill = variant == PillVariant.pill;
    final Color background;
    final Color foreground;
    if (!selected) {
      background = Colors.transparent;
      foreground = AppColors.textMuted;
    } else if (isPill) {
      background = AppColors.accent;
      foreground = AppColors.onAccent;
    } else {
      background = AppColors.border;
      foreground = AppColors.textPrimary;
    }
    final radius = BorderRadius.circular(isPill ? 999 : 9);

    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: isPill
              ? BorderSide(
                  color: selected ? AppColors.accent : AppColors.border,
                )
              : BorderSide.none,
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Container(
            height: 36,
            constraints: const BoxConstraints(minWidth: 48),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            child: Text(
              label,
              style: AppTextStyles.label.copyWith(color: foreground),
            ),
          ),
        ),
      ),
    );
  }
}
