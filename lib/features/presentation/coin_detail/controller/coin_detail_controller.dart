import 'package:get/get.dart';

import 'package:coin_dashboard/common/services/favorites_service.dart';

/// 코인 상세 화면 컨트롤러. 심볼마다 tag 로 따로 등록된다.
class CoinDetailController extends GetxController {
  final String symbol; // 예: 'BTC'
  final FavoritesService favoritesService;

  CoinDetailController(this.symbol, this.favoritesService);

  String get market => 'KRW-$symbol';

  /// Obx 안에서 읽으면 관심 목록 변화에 반응한다.
  bool get isFavorite => favoritesService.contains(market);

  void toggleFavorite() => favoritesService.toggle(market);
}
