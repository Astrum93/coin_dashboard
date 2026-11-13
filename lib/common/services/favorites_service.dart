import 'package:get/get.dart';

/// 관심 코인 목록. 홈과 상세가 함께 쓴다. 앱을 끄면 사라진다.
class FavoritesService extends GetxService {
  /// 마켓 코드. 예: 'KRW-BTC'
  final RxSet<String> markets = <String>{}.obs;

  bool contains(String market) => markets.contains(market);

  void toggle(String market) {
    if (!markets.remove(market)) markets.add(market);
  }
}
