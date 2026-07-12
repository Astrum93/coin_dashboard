import 'package:flutter/material.dart';

/// 홈 화면 (기반 뼈대 — 실제 기능은 이후 단계에서 구현).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('코인 대시보드'),
      ),
      body: const Center(child: Text('준비 중')),
    );
  }
}
