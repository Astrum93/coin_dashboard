import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';

/// 44×44 테두리 아이콘 버튼. 새로고침·관심 등록 등에 쓴다.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.color = AppColors.TEXT_PRIMARY,
    this.bordered = true,
  });

  final IconData icon;
  final String tooltip;

  /// null 이면 비활성.
  final VoidCallback? onPressed;
  final Color color;

  /// false 면 배경·테두리 없이 아이콘만. 표 안처럼 촘촘한 곳에 쓴다.
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(icon, size: 20),
      style: IconButton.styleFrom(
        fixedSize: const Size(44, 44),
        foregroundColor: color,
        disabledForegroundColor: AppColors.TEXT_MUTED,
        backgroundColor: bordered ? AppColors.SURFACE : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: bordered
              ? const BorderSide(color: AppColors.BORDER)
              : BorderSide.none,
        ),
      ),
    );
  }
}

/// 관심 코인 별 버튼.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.bordered = true,
  });

  final bool isFavorite;
  final VoidCallback onPressed;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
      tooltip: isFavorite ? '관심 해제' : '관심 추가',
      color: isFavorite ? AppColors.ACCENT : AppColors.TEXT_MUTED,
      onPressed: onPressed,
      bordered: bordered,
    );
  }
}
