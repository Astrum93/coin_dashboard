import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 원화 마켓 전체 현재가 조회 유스케이스.
class GetKrwTickers {
  final CoinRepository repository;

  GetKrwTickers(this.repository);

  Future<Result<List<MarketTicker>>> call() => repository.getKrwTickers();
}
