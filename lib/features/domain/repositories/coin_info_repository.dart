import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin_links.dart';
import 'package:coin_dashboard/features/domain/entities/news_article.dart';

/// 코인 부가 정보 리포지토리 인터페이스. 구현은 data 레이어.
abstract class CoinInfoRepository {
  /// CoinGecko 에서 코인을 못 찾으면 빈 목록.
  Future<Result<List<CoinLink>>> getLinks({
    required String symbol,
    required String englishName,
  });

  /// 코인 이름·심볼이 들어간 기사만, 최신순.
  Future<Result<List<NewsArticle>>> getNews({
    required String symbol,
    required String koreanName,
  });
}
