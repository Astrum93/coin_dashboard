import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 외부 브라우저(웹은 새 탭)로 링크를 연다. 실패하면 스낵바로 알린다.
Future<void> openExternalLink(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);
  final opened =
      uri != null && await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!opened && context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('링크를 열 수 없어요.')));
  }
}
