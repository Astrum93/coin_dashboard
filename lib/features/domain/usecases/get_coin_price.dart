import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 코인 시세 1개 조회 유스케이스.
class GetCoinPrice {
  final CoinRepository repository;

  GetCoinPrice(this.repository);

  Future<Result<Coin>> call({
    required String id,
    required String symbol,
  }) {
    return repository.getPrice(id: id, symbol: symbol);
  }
}
