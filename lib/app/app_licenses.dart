import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

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
