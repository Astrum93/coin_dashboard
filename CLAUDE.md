# 코드 규칙

## 구조
- 탑다운 트리: `app`(공용) → `features/presentation/<화면>`. 화면 폴더는 파일이 하나뿐이어도 `binding/ controller/ screen/ widget/` 뼈대를 갖춘다.
- 둘 이상의 화면이 쓰는 의존성은 `app/binding/app_binding.dart`에 둔다. 화면별 바인딩은 `app/router/app_router.dart`의 해당 `GoRoute` builder 안에서 `XxxBinding().dependencies()`로 건다.
- 자기 URL로 열리는 화면은 `presentation/` 아래 형제로 둔다. 홈→상세 같은 이동 관계는 폴더가 아니라 go_router 중첩 라우트로 표현한다.
- `main.dart`는 부팅만. `MyApp`은 `app/app.dart`.

## GetX
- `Get.find` / `Get.lazyPut` / `Get.put`에는 타입 인자를 항상 명시한다. 예: `Get.find<http.Client>()`

## 주석
- 역할 한 줄, 필요하면 주의점 한 줄까지. 규칙·이유·학습 포인트 같은 설명은 쓰지 않는다.

## 검증
- 코드 수정 후 `flutter analyze`로 이슈 0을 확인한다.
