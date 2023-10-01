import '../domain/product.dart';
import '../domain/product_repository.dart';
import '../domain/value_objects.dart';

final class ProductSearcher {
  ProductSearcher({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<Product> search(ProductId productId) async {
    try {
      return _repository.find(productId);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
