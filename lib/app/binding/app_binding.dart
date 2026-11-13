import 'package:coin_dashboard/common/services/favorites_service.dart';
import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/data/repositories/coin_repository_impl.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';
import 'package:coin_dashboard/features/domain/usecases/get_candles.dart';
import 'package:coin_dashboard/features/domain/usecases/get_krw_tickers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// 앱 공용 의존성 (http → DataSource → Repository → UseCase).
/// 화면별 바인딩은 라우터에서 건다.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut<CoinRemoteDataSource>(
      () => CoinRemoteDataSourceImpl(Get.find<http.Client>()),
    );
    Get.lazyPut<CoinRepository>(
      () => CoinRepositoryImpl(Get.find<CoinRemoteDataSource>()),
    );
    Get.lazyPut<GetKrwTickers>(() => GetKrwTickers(Get.find<CoinRepository>()));
    Get.lazyPut<GetCandles>(() => GetCandles(Get.find<CoinRepository>()));
    Get.lazyPut<FavoritesService>(() => FavoritesService());
  }
}
