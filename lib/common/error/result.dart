/// 성공(Ok) / 실패(Err) 결과 타입. switch 로 둘 다 처리해야 컴파일된다.
sealed class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

class Err<T> extends Result<T> {
  final String message;
  const Err(this.message);
}
