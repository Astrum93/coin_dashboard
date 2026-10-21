import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// CoinRepository 구현. DTO → 엔티티 변환, 예외 → Err 변환.
class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remote;

  CoinRepositoryImpl(this.remote);

  @override
  Future<Result<Coin>> getPrice({
    required String id,
    required String symbol,
  }) async {
    try {
      final model = await remote.fetchPrice(id: id, symbol: symbol);
      return Ok(model.toEntity());
    } catch (e) {
      return Err('불러오기 실패: $e');
    }
  }
}
