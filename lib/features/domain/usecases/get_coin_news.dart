import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/news_article.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_info_repository.dart';

/// 코인 관련 뉴스 조회 유스케이스.
class GetCoinNews {
  final CoinInfoRepository repository;

  GetCoinNews(this.repository);

  Future<Result<List<NewsArticle>>> call({
    required String symbol,
    required String koreanName,
  }) => repository.getNews(symbol: symbol, koreanName: koreanName);
}
