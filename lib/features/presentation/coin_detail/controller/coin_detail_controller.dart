import 'dart:async';

import 'package:get/get.dart';

import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/common/services/favorites_service.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/entities/coin_detail.dart';
import 'package:coin_dashboard/features/domain/usecases/get_candles.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_detail.dart';

/// 차트 종류.
enum ChartMode {
  candle('캔들'),
  line('라인');

  const ChartMode(this.label);
  final String label;
}

/// 상세 차트 기간과 그에 맞는 캔들 단위·개수.
enum DetailPeriod {
  minutes15('15분', CandleUnit.minutes15, 120),
  hour1('1시간', CandleUnit.minutes60, 120),
  hour4('4시간', CandleUnit.minutes240, 120),
  day('일', CandleUnit.days, 120),
  year('1년', CandleUnit.days, 365);

  const DetailPeriod(this.label, this.unit, this.count);
  final String label;
  final CandleUnit unit;
  final int count;
}

/// 코인 상세 화면 컨트롤러. 심볼마다 tag 로 따로 등록된다.
class CoinDetailController extends GetxController {
  final String symbol; // 예: 'BTC'
  final GetCoinDetail getCoinDetail;
  final GetCandles getCandles;
  final FavoritesService favoritesService;

  CoinDetailController(
    this.symbol,
    this.getCoinDetail,
    this.getCandles,
    this.favoritesService,
  );

  static const Duration refreshInterval = Duration(seconds: 3);
  static const Duration candleRefreshInterval = Duration(seconds: 30);

  final Rxn<CoinDetail> detail = Rxn<CoinDetail>();
  final RxnString error = RxnString();

  /// 오래된 것부터.
  final RxList<Candle> candles = <Candle>[].obs;
  final Rx<DetailPeriod> period = DetailPeriod.hour1.obs;
  final Rx<ChartMode> mode = ChartMode.candle.obs;
  final RxBool chartLoading = false.obs;
  final RxnString chartError = RxnString();

  Timer? _timer;
  Timer? _candleTimer;
  bool _fetching = false;

  String get market => 'KRW-$symbol';

  @override
  void onInit() {
    super.onInit();
    fetch();
    loadCandles();
    _timer = Timer.periodic(refreshInterval, (_) => fetch());
    _candleTimer = Timer.periodic(
      candleRefreshInterval,
      (_) => loadCandles(silent: true),
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    _candleTimer?.cancel();
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

  /// 캔들 조회. 응답 전에 기간이 바뀌면 결과를 버린다.
  Future<void> loadCandles({bool silent = false}) async {
    final requested = period.value;
    if (!silent) chartLoading.value = true;

    final result = await getCandles(
      market: market,
      unit: requested.unit,
      count: requested.count,
    );
    if (requested != period.value) return;

    switch (result) {
      case Ok(value: final list):
        candles.assignAll(list);
        chartError.value = null;
      case Err(message: final m):
        chartError.value = m;
    }
    chartLoading.value = false;
  }

  void changePeriod(DetailPeriod value) {
    if (period.value == value) return;
    period.value = value;
    loadCandles();
  }

  void changeMode(ChartMode value) => mode.value = value;

  /// Obx 안에서 읽으면 관심 목록 변화에 반응한다.
  bool get isFavorite => favoritesService.contains(market);

  void toggleFavorite() => favoritesService.toggle(market);
}
