import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';

/// 뉴스 기사 한 건. 북마크 카드에 필요한 만큼만.
@freezed
abstract class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required String title,
    required String summary, // 태그를 걷어낸 본문 앞부분
    required String url,
    required String source, // 예: '블록미디어'
    required DateTime publishedAt,
    String? thumbnailUrl,
  }) = _NewsArticle;
}
