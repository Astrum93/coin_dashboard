import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';

/// 코인 리포지토리 "인터페이스"(추상).
///
/// domain 은 "무엇을 할 수 있는지"만 선언하고, "어떻게" 하는지는 모른다.
/// 실제 구현(API 호출 등)은 data 레이어의 CoinRepositoryImpl 이 담당한다.
/// → presentation 은 이 인터페이스에만 의존하므로, 나중에 데이터 출처를
///   CoinGecko에서 다른 API로 바꿔도 domain/presentation 은 그대로다.
abstract class CoinRepository {
  Future<Result<Coin>> getPrice({
    required String id,
    required String symbol,
  });
}
