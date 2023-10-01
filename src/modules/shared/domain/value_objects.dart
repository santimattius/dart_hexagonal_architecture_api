// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'failures.dart';

abstract class ValueObject<T> {
  const ValueObject();

  T getOrCrash() {
    return value.fold((f) => throw ArgumentError(f), id);
  }

  Either<ValueFailure<T>, T> get value;

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      left,
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  // We cannot let a simple String be passed in. This would allow
  //for possible non-unique IDs.
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(
      right(uniqueIdStr),
    );
  }

  const UniqueId._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
