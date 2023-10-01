import 'dart:convert';

ProductDto productDtoFromJson(String str) =>
    ProductDto.fromJson(json.decode(str) as Map<String, dynamic>);

String productDtoToJson(ProductDto data) => json.encode(data.toJson());

class ProductDto {
  ProductDto({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json['id'] as String,
        name: json['name'] as String,
        price: json['price'] as double,
      );

  String id;
  String name;
  double price;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
      };
}
