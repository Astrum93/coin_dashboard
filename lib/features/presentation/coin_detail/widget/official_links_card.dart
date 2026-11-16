import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/link_launcher.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/features/domain/entities/coin_links.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 홈페이지·SNS·백서 등 공식 채널 링크 카드.
class OfficialLinksCard extends StatelessWidget {
  const OfficialLinksCard({super.key, required this.tag});

  /// 컨트롤러 tag (심볼).
  final String tag;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Expanded(child: Text('공식 채널', style: AppTextStyles.HEADING)),
              Text('출처 CoinGecko', style: AppTextStyles.CAPTION),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final links = controller.links.value;
            final error = controller.linksError.value;
            if (error != null) {
              return _Message(
                text: '공식 채널을 불러오지 못했어요.',
                onRetry: controller.loadLinks,
              );
            }
            if (links == null) {
              return const SizedBox(
                height: 44,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (links.isEmpty) {
              return const _Message(text: 'CoinGecko 에서 이 코인의 공식 채널을 찾지 못했어요.');
            }
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final link in links) _LinkChip(link: link)],
            );
          }),
        ],
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({required this.link});

  final CoinLink link;

  static IconData _icon(CoinLinkType type) => switch (type) {
    CoinLinkType.homepage => Icons.language_rounded,
    CoinLinkType.x => Icons.alternate_email_rounded,
    CoinLinkType.telegram => Icons.send_rounded,
    CoinLinkType.reddit => Icons.forum_outlined,
    CoinLinkType.github => Icons.code_rounded,
    CoinLinkType.whitepaper => Icons.description_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: link.url,
      child: OutlinedButton.icon(
        onPressed: () => openExternalLink(context, link.url),
        icon: Icon(_icon(link.type), size: 16),
        label: Text(link.type.label, style: AppTextStyles.LABEL),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.TEXT_PRIMARY,
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          side: const BorderSide(color: AppColors.BORDER),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text, this.onRetry});

  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(text, style: AppTextStyles.CAPTION)),
        if (onRetry != null)
          TextButton(onPressed: onRetry, child: const Text('다시 시도')),
      ],
    );
  }
}
