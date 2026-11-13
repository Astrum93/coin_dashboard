import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin_links.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_info_repository.dart';

/// 코인 공식 채널 조회 유스케이스.
class GetCoinLinks {
  final CoinInfoRepository repository;

  GetCoinLinks(this.repository);

  Future<Result<List<CoinLink>>> call({
    required String symbol,
    required String englishName,
  }) => repository.getLinks(symbol: symbol, englishName: englishName);
}
