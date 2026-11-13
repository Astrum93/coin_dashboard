import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/common/utils/link_launcher.dart';
import 'package:coin_dashboard/common/widgets/app_card.dart';
import 'package:coin_dashboard/features/domain/entities/news_article.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 썸네일·제목·요약이 보이는 북마크형 관련 뉴스 카드.
class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.tag});

  /// 컨트롤러 tag (심볼).
  final String tag;

  static const int _maxArticles = 5;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinDetailController>(tag: tag);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('관련 뉴스', style: AppTextStyles.HEADING),
              ),
              Text(
                ApiConstants.newsFeeds.keys.join(' · '),
                style: AppTextStyles.CAPTION,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Obx(() {
            final news = controller.news.value;
            final name = controller.detail.value?.koreanName ?? tag;
            if (controller.newsError.value != null) {
              return _Empty(
                text: '뉴스를 불러오지 못했어요.',
                action: TextButton(
                  onPressed: controller.loadNews,
                  child: const Text('다시 시도'),
                ),
              );
            }
            if (news == null) {
              return const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (news.isEmpty) {
              return _Empty(
                text: '최근 기사 중 \'$name\' 관련 기사가 없어요.',
                action: TextButton.icon(
                  onPressed: () => openExternalLink(
                    context,
                    ApiConstants.googleNewsSearch(name),
                  ),
                  icon: const Icon(Icons.open_in_new_rounded, size: 16),
                  label: Text('Google 뉴스에서 \'$name\' 보기'),
                ),
              );
            }
            final visible = news.take(_maxArticles).toList();
            return Column(
              children: [
                for (var i = 0; i < visible.length; i++) ...[
                  if (i > 0) const Divider(height: 1, color: AppColors.DIVIDER),
                  _ArticleTile(article: visible[i]),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ArticleTile extends StatelessWidget {
  const _ArticleTile({required this.article});

  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => openExternalLink(context, article.url),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final thumbWidth = constraints.maxWidth >= 480 ? 128.0 : 88.0;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  _Thumbnail(article: article, width: thumbWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.BODY_STRONG,
                        ),
                        Text(
                          article.summary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.CAPTION.copyWith(height: 1.5),
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Flexible(
                              child: Text(
                                '${article.source} · '
                                '${formatRelativeTime(article.publishedAt)}',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.CAPTION,
                              ),
                            ),
                            const Icon(
                              Icons.open_in_new_rounded,
                              size: 14,
                              color: AppColors.TEXT_MUTED,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 기사 썸네일. 없거나 못 불러오면 매체 이름 첫 글자를 보여준다.
class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.article, required this.width});

  final NewsArticle article;
  final double width;

  @override
  Widget build(BuildContext context) {
    final fallback = Container(
      color: AppColors.SURFACE_RAISED,
      alignment: Alignment.center,
      child: Text(
        article.source.characters.first,
        style: AppTextStyles.HEADING.copyWith(color: AppColors.TEXT_MUTED),
      ),
    );
    final url = article.thumbnailUrl;

    return ExcludeSemantics(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: width,
          height: width * 0.62,
          child: url == null
              ? fallback
              : Image.network(
                  url,
                  fit: BoxFit.cover,
                  // 웹에서 CORS 헤더가 없는 이미지는 <img> 로 대신 그린다.
                  webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                  errorBuilder: (_, _, _) => fallback,
                ),
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.text, required this.action});

  final String text;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(text, style: AppTextStyles.CAPTION),
          action,
        ],
      ),
    );
  }
}
