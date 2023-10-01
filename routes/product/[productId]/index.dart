import 'package:dart_frog/dart_frog.dart';

import '../../../src/modules/product/infrastructure/controllers/product_controller.dart';

Future<Response> onRequest(
  RequestContext context,
  String productId,
) async {
  final controller = context.read<ProductGetController>();
  return controller.getById(context, productId);
}
