import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';

/// 코인 리포지토리 인터페이스. 구현은 data 레이어.
abstract class CoinRepository {
  Future<Result<List<MarketTicker>>> getKrwTickers();

  /// 업비트에 없는 마켓이면 Err.
  Future<Result<CoinDetail>> getCoinDetail(String market);

  /// 오래된 것부터 정렬해 돌려준다.
  Future<Result<List<Candle>>> getCandles({
    required String market,
    required CandleUnit unit,
    required int count,
  });
}
