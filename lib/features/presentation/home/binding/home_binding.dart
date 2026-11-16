import 'package:get/get.dart';

import 'package:coin_dashboard/common/services/favorites_service.dart';
import 'package:coin_dashboard/features/domain/usecases/get_candles.dart';
import 'package:coin_dashboard/features/domain/usecases/get_krw_tickers.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 홈 전용 의존성. 공용은 AppBinding 에서 Get.find 로 받는다.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<GetKrwTickers>(),
        Get.find<GetCandles>(),
        Get.find<FavoritesService>(),
      ),
    );
  }
}
