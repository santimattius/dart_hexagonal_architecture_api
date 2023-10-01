import '../domain/product.dart';
import '../domain/product_repository.dart';
import '../domain/value_objects.dart';

final class InMemoryProductRepository implements ProductRepository {
  final Map<String, Product> products = {};
  @override
  Future<List<Product>> all() async {
    return products.values.toList();
  }

  @override
  Future<Product> find(ProductId productId) async {
    try {
      final id = productId.getOrCrash();
      final product = products[id];

      if (product == null) throw UnimplementedError();

      return product;
    } catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Product> save(Product product) async {
    try {
      final id = product.getId();
      if (products.containsKey(id)) {
        throw ArgumentError('Product exists');
      }
      products[id] = product;
      return product;
    } catch (ex) {
      throw ArgumentError();
    }
  }
}
