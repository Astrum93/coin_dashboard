# 개발 일지

\* 이 글은 개발자가 검수하고 AI가 작성하였습니다.

이 앱이 만들어지는 과정을 날짜순으로 기록합니다. 최신 항목이 위에 있습니다.

## 2026-10-21 · 🚩 업비트 API 전환과 화면 단위 구조 재편

시세 출처를 CoinGecko에서 업비트 공개 API로 바꾸고, 화면이 늘어날 것에 대비해 바인딩과 폴더를 화면 단위로 나눴다.

- 업비트 `/v1/ticker`(`KRW-BTC`)로 교체. data 레이어(상수·데이터 소스·DTO)만 수정
- 공용 의존성은 `AppBinding`, 홈 전용 의존성은 `GoRoute` builder에서 `HomeBinding`으로 분리
- `presentation/<화면>/{binding, controller, screen, widget}` 구조로 재배치, 라우터는 `app/router/`로 이동
- `MyApp`을 `app/app.dart`로 분리, 상세는 중첩 라우트(`coin/:symbol`)로 준비(현재 비활성)
- 주석을 역할 한 줄 기준으로 정리, `CLAUDE.md` 코드 규칙 추가

`#리팩토링` `#GetX` `#go_router`  ·  커밋: bd4d6d7

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
