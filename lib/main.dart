import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp.router:
    //  - 라우팅(화면 전환 · URL · 딥링크)은 go_router(appRouter)에게 위임하고
    //  - 동시에 GetX의 기능(Get.snackbar / Get.dialog / 상태관리 · DI)도 살려둔다.
    return GetMaterialApp.router(
      title: '코인 대시보드',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // ── go_router 연결: 4개의 조각을 그대로 넘긴다 ──
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      backButtonDispatcher: appRouter.backButtonDispatcher,
    );
  }
}
