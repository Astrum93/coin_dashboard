import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 리포지토리 구현 — domain 의 CoinRepository 인터페이스를 실제로 채운다.
///
/// 역할: 데이터소스에서 DTO 를 받아 → 엔티티로 변환 → Result 로 감싼다.
/// 데이터소스가 던지는 예외를 여기서 잡아 Err 로 바꿔, 상위 레이어는
/// 예외를 신경 쓰지 않고 Ok/Err 만 다루면 된다.
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
