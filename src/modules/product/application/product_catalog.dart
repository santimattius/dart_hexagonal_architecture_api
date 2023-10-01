import '../domain/product.dart';
import '../domain/product_repository.dart';

final class ProductCatalog {
  ProductCatalog({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<List<Product>> getAll() async {
    return _repository.all();
  }
}
