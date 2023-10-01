import '../domain/product.dart';
import '../domain/product_repository.dart';
import '../domain/value_objects.dart';

final class ProductCreator {
  ProductCreator({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<Product> create(
    ProductId id,
    ProductName name,
    ProductPrice price,
  ) async {
    return _repository.save(Product.create(id: id, name: name, price: price));
  }
}
