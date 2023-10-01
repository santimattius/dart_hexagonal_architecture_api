import 'package:dart_frog/src/_internal.dart';

import '../../../shared/infrastructure/Controller.dart';
import '../../../shared/infrastructure/request_context_extensions.dart';
import '../../application/product_catalog.dart';
import '../../application/product_creator.dart';
import '../../application/product_searcher.dart';
import '../../domain/value_objects.dart';
import '../product_dto.dart';

final class ProductGetController extends Controller {
  ProductGetController({
    required ProductSearcher productSearcher,
    required ProductCatalog productCatalog,
    required ProductCreator productCreator,
  })  : _productSearcher = productSearcher,
        _productCatalog = productCatalog,
        _productCreator = productCreator;

  final ProductSearcher _productSearcher;
  final ProductCatalog _productCatalog;
  final ProductCreator _productCreator;

  @override
  Future<Response> get(RequestContext context) async {
    try {
      final products = await _productCatalog.getAll();
      final response = products
          .map(
            (e) => ProductDto(
              id: e.getId(),
              name: e.getName(),
              price: e.getPrice(),
            ).toJson(),
          )
          .toList();
      return Response.json(body: {'products': response});
    } catch (ex) {
      return Response(statusCode: 400, body: ex.toString());
    }
  }

  @override
  Future<Response> post(RequestContext context) async {
    try {
      final jsonBody = await context.asJson();
      final newProduct = ProductDto.fromJson(jsonBody);
      final product = await _productCreator.create(
        ProductId(newProduct.id),
        ProductName(newProduct.name),
        ProductPrice(newProduct.price),
      );
      return Response(statusCode: 201, body: product.toString());
    } catch (ex) {
      return Response(statusCode: 400, body: ex.toString());
    }
  }

  Future<Response> getById(RequestContext context, String productId) async {
    try {
      final product = await _productSearcher.search(ProductId(productId));
      return Response(body: product.toString());
    } catch (ex) {
      return Response(statusCode: 400, body: ex.toString());
    }
  }
}
