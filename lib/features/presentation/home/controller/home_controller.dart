import 'package:get/get.dart';

import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_price.dart';

/// 홈 화면 컨트롤러. 원화 비트코인 시세를 불러온다.
class HomeController extends GetxController {
  final GetCoinPrice getCoinPrice;

  HomeController(this.getCoinPrice);

  final Rxn<Coin> coin = Rxn<Coin>();
  final RxBool loading = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    loading.value = true;
    error.value = null;

    final result = await getCoinPrice(id: 'KRW-BTC', symbol: 'BTC');

    switch (result) {
      case Ok(value: final c):
        coin.value = c;
      case Err(message: final m):
        error.value = m;
    }

    loading.value = false;
  }
}
