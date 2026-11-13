# 개발 일지

\* 이 글은 개발자가 검수하고 AI가 작성하였습니다.

이 앱이 만들어지는 과정을 날짜순으로 기록합니다. 최신 항목이 위에 있습니다.

## 2026-11-13 · 🚩 Android·iOS 플랫폼 추가

휴대폰에서도 보려고 웹뷰 래퍼 대신 같은 코드를 네이티브로 빌드하도록 모바일 플랫폼을 추가하고, 흩어진 화면 폭 기준값을 한 곳으로 모았다.

- `flutter create --platforms=android,ios`로 플랫폼 추가, 패키지·번들 ID `com.spacena.*`, 앱 이름 "코인 대시보드"
- Android release 매니페스트에 `INTERNET` 권한 추가
- `AppBreakpoints`(520/600/900/1000) 추가, 홈·셸·요약 카드·차트의 하드코딩 값 교체
- 테마 상수(`AppColors`, `AppTextStyles`, `AppBreakpoints` 등)명을 대문자 스네이크 케이스로 변경
- 단일 BTC 시세 경로(`GetCoinPrice`, `Coin`, `CoinModel`) 등 쓰지 않는 코드 삭제

`#설정` `#리팩토링` `#Flutter`  ·  커밋: 941783a, a17c349, e74894f, dd196fc

## 2026-10-21 · 🚩 업비트 전환, 구조 재편, 디자인 가이드 적용

시세 출처를 업비트로 바꾸고 화면 단위 구조로 재편한 뒤, 드리블 레퍼런스로 정한 다크 테마 디자인 가이드를 공용 위젯으로 만들어 홈을 대시보드로 다시 짰다.

- 업비트 API 전환, 공용 `AppBinding`과 화면별 바인딩 분리, `presentation/<화면>/…` 구조로 재배치
- 색·글자 토큰과 다크 테마, IBM Plex Sans KR·Mono 폰트(OFL) 번들과 라이선스 화면 등록
- 공용 위젯 9종 (`AppCard`, `StatTile`, `ChangeBadge`, `SegmentedPills`, `DashboardShell` 등)
- 원화 마켓 전체 시세(`ticker/all`)와 캔들 데이터 레이어 추가
- 홈: 시장 요약, BTC 차트, 등락률 순위, 마켓 표, 10초 자동 갱신, 사이드바 활성 표시
- 파비콘·PWA·윈도우 아이콘을 대시보드 로고로 교체

`#UI` `#기능` `#GetX`  ·  커밋: bd4d6d7, d30fd76, c18f203, 7edbc8b, 58bd105

## 2026-09-11 · 업비트 전환 준비: SDK 고정과 패키지 추가

기간: 2026-09-09 ~ 2026-09-11

시세 소스를 업비트로 옮기기 전에 개발 환경과 의존성을 정리했다.

- `pubspec.yaml`에 Flutter 최소 버전(`>=3.44.0`)을 넣어 `.fvmrc`와 맞춤
- analyzer가 `.fvm` 디렉터리를 분석하지 않도록 제외
- 템플릿 카운터 테스트 제거
- 업비트 응답 파싱용 `json_serializable`, 숫자 포맷용 `intl` 추가

`#설정` `#FVM`  ·  커밋: d2b1304, 0252579

## 2026-07-13 · 코인 시세 기능 (BTC/KRW)

기간: 2026-07-13 ~ 2026-07-13

CoinGecko API로 BTC 원화 시세를 받아 홈 화면과 상세 화면에 보여주는 첫 기능을 클린 아키텍처로 구현했다.

- domain(Coin·CoinRepository·GetCoinPrice) / data(CoinModel·RemoteDataSource·RepositoryImpl) 계층 분리
- GetX 컨트롤러 + `Obx` 반응형 UI, `CoinBinding`으로 의존성 주입
- 실패를 `Result`(Ok/Err)로 반환해 컨트롤러에서 분기 처리
- go_router 딥링크 `/coin/:symbol` 상세 화면 추가
- `Get.snackbar` 오버레이 null 크래시 수정 (go_router 루트 Navigator 키를 `Get.addKey`로 등록)

`#기능` `#GetX`  ·  커밋: 76d7b3c, d85e125

## 2026-07-13 · 🚩 프로젝트 시작 (v1.0.0)

기간: 2026-07-13 ~ 2026-07-13

Flutter 웹·윈도우 타깃으로 코인 대시보드 프로젝트의 뼈대를 세웠다.

- GetX(상태관리·DI), go_router(라우팅·딥링크), http, freezed·build_runner 설치
- `app / common / features(data·domain·presentation)` 폴더 구조
- `GetMaterialApp.router`로 GetX와 go_router 통합
- FVM으로 Flutter 3.44.6 고정

`#설정` `#GetX`  ·  커밋: 38460fe
