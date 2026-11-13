import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 캔들 조회 유스케이스.
class GetCandles {
  final CoinRepository repository;

  GetCandles(this.repository);

  Future<Result<List<Candle>>> call({
    required String market,
    required CandleUnit unit,
    required int count,
  }) {
    return repository.getCandles(market: market, unit: unit, count: count);
  }
}
