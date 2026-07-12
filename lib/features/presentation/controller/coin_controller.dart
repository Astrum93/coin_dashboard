import 'package:get/get.dart';

import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/coin.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_price.dart';

/// 코인 화면의 상태와 로직을 담는 GetX 컨트롤러.
///
/// 기존 setState 방식의 _loading / _priceKrw / _error 변수가
/// 여기서 Rx(반응형) 변수로 바뀐다. 값이 바뀌면 Obx 로 감싼 위젯만
/// 자동으로 다시 그려진다. (화면 코드에 setState 가 사라진다)
class CoinController extends GetxController {
  final GetCoinPrice getCoinPrice;

  CoinController(this.getCoinPrice);

  // ── 반응형 상태 ──
  final Rxn<Coin> coin = Rxn<Coin>(); // 성공 시 코인 (null이면 아직 없음)
  final RxBool loading = false.obs; // 로딩 여부
  final RxnString error = RxnString(); // 실패 메시지 (null이면 에러 없음)

  @override
  void onInit() {
    super.onInit();
    fetch(); // 화면이 처음 뜰 때 자동으로 불러온다 (기존 initState 역할)
  }

  Future<void> fetch() async {
    loading.value = true;
    error.value = null;

    final result = await getCoinPrice(id: 'bitcoin', symbol: 'BTC');

    // sealed Result 라서 Ok/Err 를 둘 다 처리해야 컴파일된다.
    switch (result) {
      case Ok(value: final c):
        coin.value = c;
      case Err(message: final m):
        error.value = m;
    }

    loading.value = false;
  }
}
