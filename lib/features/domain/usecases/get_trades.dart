import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/trade.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 최근 체결 조회 유스케이스.
class GetTrades {
  final CoinRepository repository;

  GetTrades(this.repository);

  Future<Result<List<Trade>>> call(String market, {int count = 12}) =>
      repository.getTrades(market, count: count);
}
