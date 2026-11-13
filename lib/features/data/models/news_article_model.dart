import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/news_article.dart';

part 'news_article_model.freezed.dart';

/// rss2json 피드 항목 DTO.
@freezed
abstract class NewsArticleModel with _$NewsArticleModel {
  const NewsArticleModel._();

  const factory NewsArticleModel({
    required String title,
    required String description, // HTML 이 섞여 올 수 있다
    required String link,
    required String pubDate, // UTC 'yyyy-MM-dd HH:mm:ss'
    String? thumbnail,
  }) = _NewsArticleModel;

  /// 피드 항목 한 건. 썸네일은 thumbnail, 없으면 enclosure.link 에서 찾는다.
  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    String? text(Object? value) =>
        value is String && value.isNotEmpty ? value : null;
    final enclosure = json['enclosure'];
    return NewsArticleModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      link: json['link'] as String? ?? '',
      pubDate: json['pubDate'] as String? ?? '',
      thumbnail:
          text(json['thumbnail']) ??
          (enclosure is Map<String, dynamic> ? text(enclosure['link']) : null),
    );
  }

  /// DTO → 엔티티. [source] 는 피드 이름.
  NewsArticle toEntity({required String source}) => NewsArticle(
    title: _plain(title),
    summary: _plain(description),
    url: link,
    source: source,
    publishedAt:
        DateTime.tryParse('${pubDate.replaceFirst(' ', 'T')}Z')?.toLocal() ??
        DateTime.now(),
    thumbnailUrl: thumbnail,
  );

  /// 태그를 지우고 자주 나오는 HTML 엔티티만 되돌린다.
  static String _plain(String html) => html
      .replaceAll(RegExp(r'<[^>]*>'), ' ')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&quot;', '"')
      .replaceAll('&#39;', "'")
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&amp;', '&')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}
