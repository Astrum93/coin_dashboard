import 'package:flutter/material.dart';

import 'package:coin_dashboard/app/theme/app_breakpoints.dart';
import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';

/// 사이드바 메뉴 항목.
class ShellNavItem {
  const ShellNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;
}

/// 사이드바 + 본문 레이아웃. 좁은 화면(AppBreakpoints.SIDEBAR 미만)에선 메뉴가 위로 올라간다.
class DashboardShell extends StatelessWidget {
  const DashboardShell({
    super.key,
    required this.navItems,
    required this.child,
    this.connected = true,
  });

  final List<ShellNavItem> navItems;
  final Widget child;

  /// 업비트 API 연결 상태 표시.
  final bool connected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= AppBreakpoints.SIDEBAR;
          final sidebar = _Sidebar(
            navItems: navItems,
            connected: connected,
            wide: wide,
          );
          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sidebar,
                Expanded(child: child),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sidebar,
              Expanded(child: child),
            ],
          );
        },
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.navItems,
    required this.connected,
    required this.wide,
  });

  final List<ShellNavItem> navItems;
  final bool connected;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    final nav = [
      for (final item in navItems) _NavTile(item: item, expand: wide),
    ];

    return Container(
      width: wide ? 220 : null,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: wide ? 24 : 12),
      decoration: BoxDecoration(
        color: AppColors.SIDEBAR,
        border: Border(
          right: wide
              ? const BorderSide(color: AppColors.BORDER)
              : BorderSide.none,
          bottom: wide
              ? BorderSide.none
              : const BorderSide(color: AppColors.BORDER),
        ),
      ),
      child: wide
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Logo(),
                const SizedBox(height: 32),
                ...nav,
                const Spacer(),
                _ConnectionCard(connected: connected),
              ],
            )
          : Wrap(
              spacing: 4,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [const _Logo(), const SizedBox(width: 12), ...nav],
            ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.ACCENT,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.show_chart_rounded,
              size: 20,
              color: AppColors.ON_ACCENT,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              '코인 대시보드',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.HEADING.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({required this.item, required this.expand});

  final ShellNavItem item;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final color = item.selected ? AppColors.TEXT_PRIMARY : AppColors.TEXT_MUTED;
    final radius = BorderRadius.circular(10);

    return Padding(
      padding: EdgeInsets.only(bottom: expand ? 4 : 0),
      child: Semantics(
        button: true,
        selected: item.selected,
        child: Material(
          color: item.selected ? AppColors.SURFACE_RAISED : Colors.transparent,
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: item.onTap,
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  Icon(item.icon, size: 18, color: color),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      item.label,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.BODY.copyWith(
                        color: color,
                        fontWeight: item.selected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({required this.connected});

  final bool connected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.SURFACE,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.BORDER),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: connected ? AppColors.ACCENT : AppColors.RISE,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  connected ? '업비트 API 연결됨' : '업비트 API 연결 끊김',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.LABEL,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text('시세 자동 갱신 · 공개 API', style: AppTextStyles.CAPTION),
        ],
      ),
    );
  }
}
