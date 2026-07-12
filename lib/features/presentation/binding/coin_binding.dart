import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:coin_dashboard/features/data/datasources/coin_remote_data_source.dart';
import 'package:coin_dashboard/features/data/repositories/coin_repository_impl.dart';
import 'package:coin_dashboard/features/domain/repositories/coin_repository.dart';
import 'package:coin_dashboard/features/domain/usecases/get_coin_price.dart';
import 'package:coin_dashboard/features/presentation/controller/coin_controller.dart';

/// 의존성 주입(DI) 바인딩 — 이 기능이 필요로 하는 객체들을 GetX에 등록한다.
///
/// 등록 순서대로 "조립"된다:
///   http.Client → DataSource → RepositoryImpl → UseCase → Controller
/// 각 객체는 Get.find() 로 바로 아래(안쪽) 의존성을 받아 만들어진다.
///
/// ※ go_router를 쓰므로 GetPage 자동 바인딩이 안 먹힌다. 그래서 이 바인딩을
///   main 의 GetMaterialApp.router(initialBinding: ...) 에서 직접 걸어준다.
///   (인터페이스 타입으로 등록해 두면, 상위 코드는 구현이 아니라 추상에 의존한다.)
class CoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut<CoinRemoteDataSource>(
      () => CoinRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<CoinRepository>(() => CoinRepositoryImpl(Get.find()));
    Get.lazyPut(() => GetCoinPrice(Get.find()));
    Get.lazyPut(() => CoinController(Get.find()));
  }
}
