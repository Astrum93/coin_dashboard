/// 성공/실패를 담는 결과 타입. (Dart 3의 sealed class + 패턴 매칭 활용)
///
/// 리포지토리가 예외를 "던지는" 대신 이 Result 를 "반환"하면,
/// 컨트롤러가 switch 로 성공(Ok)과 실패(Err)를 *반드시* 둘 다 처리하게 된다.
/// → 에러 처리를 깜빡할 수 없게 컴파일러가 강제해준다.
sealed class Result<T> {
  const Result();
}

/// 성공: 값을 담는다.
class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

/// 실패: 에러 메시지를 담는다.
class Err<T> extends Result<T> {
  final String message;
  const Err(this.message);
}
