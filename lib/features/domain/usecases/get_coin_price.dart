import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';

/// 유스케이스: "코인 시세 1개를 가져온다"라는 *하나의 비즈니스 동작*.
///
/// 지금은 리포지토리를 그대로 호출할 뿐이라 얇지만, 이 자리가 있으면
/// 나중에 "즐겨찾기면 우선 표시" 같은 규칙이 생겼을 때 여기에 담으면 된다.
/// call() 로 정의하면 인스턴스를 함수처럼 호출할 수 있다: getCoinPrice(id: ...)
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
