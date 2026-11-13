import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 한 종목 상세 시세 조회 유스케이스.
class GetCoinDetail {
  final CoinRepository repository;

  GetCoinDetail(this.repository);

  /// [market] 예: 'KRW-BTC'
  Future<Result<CoinDetail>> call(String market) =>
      repository.getCoinDetail(market);
}
