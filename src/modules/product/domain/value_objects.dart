import 'package:dartz/dartz.dart';

import '../../shared/domain/failures.dart';
import '../../shared/domain/value_objects.dart';
import '../../shared/domain/value_validators.dart';

final class ProductId extends ValueObject<String> {
  factory ProductId(String value) => ProductId._(validateStringNotEmpty(value));

  ProductId._(this.value) : super() {
    if (!isValid()) {
      throw ArgumentError('Invalid argument');
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;
}

final class ProductName extends ValueObject<String> {
  factory ProductName(String value) =>
      ProductName._(validateStringNotEmpty(value));

  const ProductName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

final class ProductPrice extends ValueObject<double> {
  factory ProductPrice(double value) => ProductPrice._(validatePrice(value));

  const ProductPrice._(this.value);

  @override
  final Either<ValueFailure<double>, double> value;
}
