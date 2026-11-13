import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 사이드바 '정보' 메뉴. 앱 이름·데이터 출처와 라이선스 목록을 보여준다.
void showAppInfo(BuildContext context) => showLicensePage(
  context: context,
  applicationName: '코인 대시보드',
  applicationLegalese: '시세: 업비트 공개 API · 코인 정보: CoinGecko · 뉴스: 블록미디어, 토큰포스트',
);

/// 번들한 폰트의 라이선스를 라이선스 화면에 등록한다.
void registerAppLicenses() {
  LicenseRegistry.addLicense(() async* {
    final ofl = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks([
      'IBM Plex Sans KR',
      'IBM Plex Mono',
    ], ofl);
  });
}
