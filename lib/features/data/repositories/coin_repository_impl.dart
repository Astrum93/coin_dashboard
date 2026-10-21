import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// CoinRepository 구현. DTO → 엔티티 변환, 예외 → Err 변환.
class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remote;

  CoinRepositoryImpl(this.remote);

  /// 마켓 한글명 캐시. 목록은 자주 바뀌지 않아 처음 한 번만 받는다.
  Map<String, String>? _names;

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

  @override
  Future<Result<List<MarketTicker>>> getKrwTickers() async {
    try {
      final names = _names ??= await remote.fetchMarketNames();
      final models = await remote.fetchKrwTickers();
      return Ok([
        for (final m in models)
          m.toEntity(koreanName: names[m.market] ?? m.market.split('-').last),
      ]);
    } catch (e) {
      return Err('시세 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<List<Candle>>> getCandles({
    required String market,
    required CandleUnit unit,
    required int count,
  }) async {
    try {
      final models = await remote.fetchCandles(
        market: market,
        unit: unit,
        count: count,
      );
      return Ok(models.reversed.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Err('차트 불러오기 실패: $e');
    }
  }
}
