import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// 코인 검색 입력창.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.hintText = '코인명 또는 심볼 검색',
    this.onChanged,
    this.controller,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.BORDER),
    );

    return SizedBox(
      height: 44,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyles.BODY,
        cursorColor: AppColors.ACCENT,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.BODY.copyWith(color: AppColors.TEXT_MUTED),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 18,
            color: AppColors.TEXT_MUTED,
          ),
          filled: true,
          fillColor: AppColors.SURFACE,
          contentPadding: EdgeInsets.zero,
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.ACCENT),
          ),
        ),
      ),
    );
  }
}
