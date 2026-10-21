import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coin_dashboard/app/app.dart';
import 'package:coin_dashboard/app/router/app_router.dart';

/// 앱 부팅 진입점.
void main() {
  // Get.snackbar / Get.dialog 가 go_router 의 Navigator 를 찾도록 키 공유.
  Get.addKey(rootNavigatorKey);
  runApp(const MyApp());
}
