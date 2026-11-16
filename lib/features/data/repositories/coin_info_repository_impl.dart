import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/data/datasources/coin_info_remote_data_source.dart';
import 'package:coin_dashboard/features/domain/entities/coin_links.dart';
import 'package:coin_dashboard/features/domain/entities/news_article.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_info_repository.dart';

/// CoinInfoRepository 구현. 외부 서비스 호출 수를 줄이려고 결과를 캐시한다.
class CoinInfoRepositoryImpl implements CoinInfoRepository {
  final CoinInfoRemoteDataSource remote;

  CoinInfoRepositoryImpl(this.remote);

  static const Duration _newsTtl = Duration(minutes: 5);

  /// 심볼 → 공식 링크. 성공한 결과만 남긴다.
  final Map<String, List<CoinLink>> _links = {};

  /// 피드에서 받은 전체 기사와 받은 시각.
  List<NewsArticle>? _articles;
  DateTime? _articlesAt;

  @override
  Future<Result<List<CoinLink>>> getLinks({
    required String symbol,
    required String englishName,
  }) async {
    final cached = _links[symbol];
    if (cached != null) return Ok(cached);
    try {
      final hits = await remote.searchCoins(symbol);
      final id = _pickId(hits, symbol: symbol, englishName: englishName);
      final links = id == null
          ? <CoinLink>[]
          : (await remote.fetchLinks(id)).toEntity();
      _links[symbol] = links;
      return Ok(links);
    } catch (e) {
      return Err('공식 채널 불러오기 실패: $e');
    }
  }

  /// 심볼이 같은 것 중 영문명까지 같은 것을 우선, 없으면 순위가 가장 높은 것.
  static String? _pickId(
    List<CoinSearchHit> hits, {
    required String symbol,
    required String englishName,
  }) {
    String norm(String s) => s.toLowerCase().replaceAll(RegExp(r'\s'), '');
    final same = hits.where((h) => h.symbol.toUpperCase() == symbol).toList();
    for (final h in same) {
      if (norm(h.name) == norm(englishName)) return h.id;
    }
    return same.firstOrNull?.id;
  }

  @override
  Future<Result<List<NewsArticle>>> getNews({
    required String symbol,
    required String koreanName,
  }) async {
    try {
      final articles = await _allArticles();
      // 짧은 심볼은 다른 단어에 섞이기 쉬워 3글자 이상만 본다.
      final symbolPattern = symbol.length >= 3
          ? RegExp('(?<![A-Za-z])${RegExp.escape(symbol)}(?![A-Za-z])')
          : null;
      bool matches(String text) =>
          text.contains(koreanName) || (symbolPattern?.hasMatch(text) ?? false);
      return Ok(
        articles.where((a) => matches(a.title) || matches(a.summary)).toList(),
      );
    } catch (e) {
      return Err('뉴스 불러오기 실패: $e');
    }
  }

  /// 모든 피드를 합쳐 최신순으로. 한 피드가 실패해도 나머지는 쓴다.
  Future<List<NewsArticle>> _allArticles() async {
    final at = _articlesAt;
    final cached = _articles;
    if (cached != null &&
        at != null &&
        DateTime.now().difference(at) < _newsTtl) {
      return cached;
    }

    final results = await Future.wait([
      for (final MapEntry(key: source, value: url)
          in ApiConstants.newsFeeds.entries)
        remote
            .fetchFeed(url)
            .then<List<NewsArticle>?>(
              (items) => [for (final m in items) m.toEntity(source: source)],
            )
            .catchError((Object _) => null),
    ]);
    final loaded = results.whereType<List<NewsArticle>>().toList();
    if (loaded.isEmpty) throw Exception('모든 뉴스 피드 응답 실패');

    final articles = loaded.expand((list) => list).toList()
      ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    _articles = articles;
    _articlesAt = DateTime.now();
    return articles;
  }
}
