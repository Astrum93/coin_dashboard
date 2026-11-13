import 'package:get/get.dart';

import 'package:coin_dashboard/common/services/favorites_service.dart';
import 'package:coin_dashboard/features/domain/usecases/get_candles.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_detail.dart';
import 'package:coin_dashboard/features/domain/usecases/get_orderbook.dart';
import 'package:coin_dashboard/features/domain/usecases/get_trades.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 코인 상세 전용 의존성. 컨트롤러는 symbol 을 tag 로 등록한다.
class CoinDetailBinding extends Bindings {
  CoinDetailBinding(this.symbol);

  final String symbol;

  @override
  void dependencies() {
    Get.lazyPut<CoinDetailController>(
      () => CoinDetailController(
        symbol,
        Get.find<GetCoinDetail>(),
        Get.find<GetCandles>(),
        Get.find<GetOrderbook>(),
        Get.find<GetTrades>(),
        Get.find<FavoritesService>(),
      ),
      tag: symbol,
    );
  }
}
