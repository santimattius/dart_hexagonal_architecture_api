import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(Empty.create(value: input));
  }
}

Either<ValueFailure<double>, double> validatePrice(double input) {
  if (input > 0.0) {
    return right(input);
  } else {
    return left(Invalid.create(value: input));
  }
}
