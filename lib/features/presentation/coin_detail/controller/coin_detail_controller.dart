import 'dart:async';

import 'package:get/get.dart';

import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/common/services/favorites_service.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_detail.dart';

/// 코인 상세 화면 컨트롤러. 심볼마다 tag 로 따로 등록된다.
class CoinDetailController extends GetxController {
  final String symbol; // 예: 'BTC'
  final GetCoinDetail getCoinDetail;
  final FavoritesService favoritesService;

  CoinDetailController(this.symbol, this.getCoinDetail, this.favoritesService);

  static const Duration refreshInterval = Duration(seconds: 3);

  final Rxn<CoinDetail> detail = Rxn<CoinDetail>();
  final RxnString error = RxnString();

  Timer? _timer;
  bool _fetching = false;

  String get market => 'KRW-$symbol';

  @override
  void onInit() {
    super.onInit();
    fetch();
    _timer = Timer.periodic(refreshInterval, (_) => fetch());
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  /// 시세 조회. 실패해도 마지막으로 받은 시세는 남겨 둔다.
  Future<void> fetch() async {
    if (_fetching) return;
    _fetching = true;

    final result = await getCoinDetail(market);

    switch (result) {
      case Ok(value: final value):
        detail.value = value;
        error.value = null;
      case Err(message: final m):
        error.value = m;
    }
    _fetching = false;
  }

  /// Obx 안에서 읽으면 관심 목록 변화에 반응한다.
  bool get isFavorite => favoritesService.contains(market);

  void toggleFavorite() => favoritesService.toggle(market);
}
