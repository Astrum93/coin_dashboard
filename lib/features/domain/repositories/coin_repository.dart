import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';

/// 코인 리포지토리 인터페이스. 구현은 data 레이어.
abstract class CoinRepository {
  Future<Result<Coin>> getPrice({
    required String id,
    required String symbol,
  });
}
