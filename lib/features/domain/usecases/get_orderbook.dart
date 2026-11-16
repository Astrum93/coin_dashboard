import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/orderbook.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 호가 조회 유스케이스.
class GetOrderbook {
  final CoinRepository repository;

  GetOrderbook(this.repository);

  /// [levels] 단계 수 (최대 30).
  Future<Result<Orderbook>> call(String market, {int levels = 5}) =>
      repository.getOrderbook(market, levels: levels);
}
