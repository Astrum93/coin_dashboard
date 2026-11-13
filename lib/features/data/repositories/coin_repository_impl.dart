import 'dart:math' as math;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/data/models/candle_model.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';
import 'package:coin_dashboard/features/domain/entities/orderbook.dart';
import 'package:coin_dashboard/features/domain/entities/trade.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// CoinRepository 구현. DTO → 엔티티 변환, 예외 → Err 변환.
class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remote;

  CoinRepositoryImpl(this.remote);

  /// 마켓 한글명 캐시. 목록은 자주 바뀌지 않아 처음 한 번만 받는다.
  Future<Map<String, MarketName>>? _names;

  /// 동시에 불려도 한 번만 요청하고, 실패하면 다음에 다시 받는다.
  Future<Map<String, MarketName>> _marketNames() async {
    try {
      return await (_names ??= remote.fetchMarketNames());
    } catch (_) {
      _names = null;
      rethrow;
    }
  }

  static String _unknown(String market) => '업비트에 없는 마켓입니다: $market';

  @override
  Future<Result<List<MarketTicker>>> getKrwTickers() async {
    try {
      final names = await _marketNames();
      final models = await remote.fetchKrwTickers();
      return Ok([
        for (final m in models)
          m.toEntity(
            koreanName: names[m.market]?.korean ?? m.market.split('-').last,
          ),
      ]);
    } catch (e) {
      return Err('시세 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<CoinDetail>> getCoinDetail(String market) async {
    try {
      final name = (await _marketNames())[market];
      if (name == null) return Err(_unknown(market));
      final model = await remote.fetchTicker(market);
      return Ok(
        model.toEntity(koreanName: name.korean, englishName: name.english),
      );
    } catch (e) {
      return Err('시세 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<Orderbook>> getOrderbook(
    String market, {
    required int levels,
  }) async {
    try {
      if (!(await _marketNames()).containsKey(market)) {
        return Err(_unknown(market));
      }
      final model = await remote.fetchOrderbook(market, levels);
      return Ok(model.toEntity());
    } catch (e) {
      return Err('호가 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<List<Trade>>> getTrades(
    String market, {
    required int count,
  }) async {
    try {
      if (!(await _marketNames()).containsKey(market)) {
        return Err(_unknown(market));
      }
      final models = await remote.fetchTrades(market, count);
      return Ok(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Err('체결 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<List<Candle>>> getCandles({
    required String market,
    required CandleUnit unit,
    required int count,
  }) async {
    try {
      // 한 번에 200개까지라 넘치면 가장 오래된 캔들 이전을 이어 받는다.
      final models = <CandleModel>[];
      String? to;
      while (models.length < count) {
        final size = math.min(
          ApiConstants.candleMaxCount,
          count - models.length,
        );
        final page = await remote.fetchCandles(
          market: market,
          unit: unit,
          count: size,
          to: to,
        );
        models.addAll(page);
        if (page.length < size) break;
        to = '${page.last.candleDateTimeUtc}Z';
      }
      return Ok(models.reversed.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Err('차트 불러오기 실패: $e');
    }
  }
}
