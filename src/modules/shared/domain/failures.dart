sealed class ValueFailure<T> {
  ValueFailure({required this.failedValue});

  final T failedValue;
}

class Empty<T> extends ValueFailure<T> {
  Empty._({required T value}) : super(failedValue: value);

  factory Empty.create({required T value}) => Empty._(value: value);
}

class Invalid<T> extends ValueFailure<T> {
  Invalid._({required T value}) : super(failedValue: value);

  factory Invalid.create({required T value}) => Invalid._(value: value);
}
