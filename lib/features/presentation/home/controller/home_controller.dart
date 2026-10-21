import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/common/error/result.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/domain/entities/market_ticker.dart';
import 'package:coin_dashboard/features/domain/usecases/get_candles.dart';
import 'package:coin_dashboard/features/domain/usecases/get_krw_tickers.dart';

/// 원화 마켓 표 필터.
enum MarketFilter {
  all('전체'),
  favorite('관심'),
  rise('상승'),
  fall('하락');

  const MarketFilter(this.label);
  final String label;
}

/// 대표 차트 기간과 그에 맞는 캔들 단위·개수.
enum ChartPeriod {
  day('1일', CandleUnit.minutes30, 48),
  week('1주', CandleUnit.minutes240, 42),
  month('1개월', CandleUnit.days, 30),
  year('1년', CandleUnit.weeks, 52);

  const ChartPeriod(this.label, this.unit, this.count);
  final String label;
  final CandleUnit unit;
  final int count;
}

/// 사이드바 메뉴 중 현재 위치를 나타내는 항목.
enum HomeNav { dashboard, markets, favorites }

/// 홈 화면 컨트롤러. 원화 마켓 시세와 대표 코인 차트를 관리한다.
class HomeController extends GetxController {
  final GetKrwTickers getKrwTickers;
  final GetCandles getCandles;

  HomeController(this.getKrwTickers, this.getCandles);

  static const String featuredMarket = 'KRW-BTC';
  static const Duration refreshInterval = Duration(seconds: 10);
  static const int pageSize = 30;

  /// 24시간 거래대금 내림차순.
  final RxList<MarketTicker> tickers = <MarketTicker>[].obs;
  final RxBool loading = false.obs;
  final RxnString error = RxnString();
  final Rxn<DateTime> updatedAt = Rxn<DateTime>();

  final RxList<Candle> candles = <Candle>[].obs;
  final Rx<ChartPeriod> period = ChartPeriod.day.obs;
  final RxBool chartLoading = false.obs;
  final RxnString chartError = RxnString();

  final RxString query = ''.obs;
  final Rx<MarketFilter> filter = MarketFilter.all.obs;
  final RxSet<String> favorites = <String>{}.obs; // 마켓 코드. 앱을 끄면 사라진다
  final RxBool showRisers = true.obs;
  final RxInt visibleCount = pageSize.obs;

  final ScrollController scrollController = ScrollController();
  final GlobalKey marketSectionKey = GlobalKey();

  /// 원화 마켓 표가 화면 위쪽까지 스크롤됐는지. 사이드바 활성 표시에 쓴다.
  final RxBool inMarketSection = false.obs;

  Timer? _timer;
  bool _fetching = false;

  @override
  void onInit() {
    super.onInit();
    fetch();
    loadCandles();
    _timer = Timer.periodic(refreshInterval, (_) => fetch(silent: true));
    scrollController.addListener(_syncSection);
  }

  @override
  void onClose() {
    _timer?.cancel();
    scrollController.dispose();
    super.onClose();
  }

  /// 원화 마켓 시세 조회. silent 면 로딩 표시 없이 갱신한다.
  Future<void> fetch({bool silent = false}) async {
    if (_fetching) return;
    _fetching = true;
    if (!silent) loading.value = true;

    final result = await getKrwTickers();

    switch (result) {
      case Ok(value: final list):
        tickers.assignAll(
          list.toList()
            ..sort((a, b) => b.tradePrice24h.compareTo(a.tradePrice24h)),
        );
        updatedAt.value = DateTime.now();
        error.value = null;
      case Err(message: final m):
        error.value = m;
    }

    loading.value = false;
    _fetching = false;
  }

  Future<void> refreshAll() async {
    await Future.wait([fetch(), loadCandles()]);
  }

  /// 대표 코인 캔들 조회. 응답 전에 기간이 바뀌면 결과를 버린다.
  Future<void> loadCandles() async {
    final requested = period.value;
    chartLoading.value = true;

    final result = await getCandles(
      market: featuredMarket,
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

  void changePeriod(ChartPeriod value) {
    if (period.value == value) return;
    period.value = value;
    loadCandles();
  }

  void changeFilter(MarketFilter value) {
    filter.value = value;
    visibleCount.value = pageSize;
  }

  void changeQuery(String value) {
    query.value = value.trim();
    visibleCount.value = pageSize;
  }

  void showMore() => visibleCount.value += pageSize;

  void toggleFavorite(String market) {
    if (!favorites.remove(market)) favorites.add(market);
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollToMarkets({MarketFilter? withFilter}) {
    if (withFilter != null) changeFilter(withFilter);
    final context = marketSectionKey.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// 스크롤 위치로 표 영역 진입 여부를 갱신한다.
  void _syncSection() {
    final box = marketSectionKey.currentContext?.findRenderObject();
    if (box == null || !scrollController.hasClients) return;
    final position = scrollController.position;
    if (position.maxScrollExtent <= 0) {
      inMarketSection.value = false;
      return;
    }
    // 표가 짧아 맨 위까지 못 올라오는 경우를 위해 최대 스크롤 위치로 제한.
    final reveal = RenderAbstractViewport.of(
      box,
    ).getOffsetToReveal(box, 0).offset;
    final threshold = math.min(reveal, position.maxScrollExtent) - 80;
    inMarketSection.value = position.pixels >= threshold;
  }

  HomeNav get activeNav {
    if (!inMarketSection.value) return HomeNav.dashboard;
    return filter.value == MarketFilter.favorite
        ? HomeNav.favorites
        : HomeNav.markets;
  }

  MarketTicker? get featured {
    for (final t in tickers) {
      if (t.market == featuredMarket) return t;
    }
    return null;
  }

  int get riseCount => tickers.where((t) => t.changeRate > 0).length;
  int get fallCount => tickers.where((t) => t.changeRate < 0).length;

  double get totalTradePrice =>
      tickers.fold(0, (sum, t) => sum + t.tradePrice24h);

  List<MarketTicker> get favoriteTickers =>
      tickers.where((t) => favorites.contains(t.market)).toList();

  /// 관심 코인 평균 등락률. 관심 코인이 없으면 null.
  double? get favoriteAverageRate {
    final list = favoriteTickers;
    if (list.isEmpty) return null;
    return list.fold<double>(0, (sum, t) => sum + t.changeRate) / list.length;
  }

  /// 차트 기간 동안의 등락률.
  double? get periodChangeRate {
    if (candles.isEmpty) return null;
    final first = candles.first.open;
    return (candles.last.close - first) / first * 100;
  }

  /// 등락률 상위(또는 하위) 5개.
  List<MarketTicker> get movers {
    final sorted = tickers.toList()
      ..sort(
        (a, b) => showRisers.value
            ? b.changeRate.compareTo(a.changeRate)
            : a.changeRate.compareTo(b.changeRate),
      );
    return sorted.take(5).toList();
  }

  int countFor(MarketFilter value) => tickers.where(_matcher(value)).length;

  List<MarketTicker> get filteredTickers {
    final q = query.value.toLowerCase();
    return tickers
        .where(_matcher(filter.value))
        .where(
          (t) =>
              q.isEmpty ||
              t.koreanName.toLowerCase().contains(q) ||
              t.symbol.toLowerCase().contains(q),
        )
        .toList();
  }

  bool Function(MarketTicker) _matcher(MarketFilter value) => switch (value) {
    MarketFilter.all => (_) => true,
    MarketFilter.favorite => (t) => favorites.contains(t.market),
    MarketFilter.rise => (t) => t.changeRate > 0,
    MarketFilter.fall => (t) => t.changeRate < 0,
  };
}
