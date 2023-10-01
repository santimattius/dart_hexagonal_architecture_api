import 'product.dart';
import 'value_objects.dart';

abstract class ProductRepository {
  Future<List<Product>> all();

  Future<Product> find(ProductId productId);

  Future<Product> save(Product product);
}
