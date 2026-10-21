import 'package:get/get.dart';

import 'package:coin_dashboard/features/domain/usecases/get_coin_price.dart';
import 'package:coin_dashboard/features/presentation/home/controller/home_controller.dart';

/// 홈 전용 의존성. 공용은 AppBinding 에서 Get.find 로 받는다.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<GetCoinPrice>()),
    );
  }
}
