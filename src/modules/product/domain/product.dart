import 'value_objects.dart';

final class Product {
  Product({required this.id, required this.name, required this.price});

  factory Product.create({
    required ProductId id,
    required ProductName name,
    required ProductPrice price,
  }) =>
      Product(id: id, name: name, price: price);

  final ProductId id;
  final ProductName name;
  final ProductPrice price;

  String getId() => id.getOrCrash();
  String getName() => name.getOrCrash();
  double getPrice() => price.getOrCrash();
}
