import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/binding/app_binding.dart';
import 'package:coin_dashboard/app/router/app_router.dart';

/// 앱 루트 위젯. 테마·공용 의존성·라우팅 설정.
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
      initialBinding: AppBinding(),
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      backButtonDispatcher: appRouter.backButtonDispatcher,
    );
  }
}
