import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/app_router.dart';
import 'package:coin_dashboard/features/presentation/binding/coin_binding.dart';

void main() {
  // go_router의 루트 Navigator 키를 GetX에도 등록한다.
  // → Get.snackbar / Get.dialog 가 이 Navigator의 오버레이를 찾을 수 있게 됨.
  Get.addKey(rootNavigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: '코인 대시보드',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // 앱 시작 시 코인 기능의 의존성(데이터소스·리포지토리·유스케이스·컨트롤러)을 등록.
      // go_router를 쓰면 GetPage 자동 바인딩이 안 먹혀서, 여기서 직접 걸어준다.
      initialBinding: CoinBinding(),
      // 라우팅(화면 전환·URL·딥링크)은 go_router에게 위임.
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      backButtonDispatcher: appRouter.backButtonDispatcher,
    );
  }
}
