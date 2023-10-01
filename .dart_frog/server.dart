// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../main.dart' as entrypoint;
import '../routes/index.dart' as index;
import '../routes/product/index.dart' as product_index;
import '../routes/product/[productId]/index.dart' as product_$product_id_index;
import '../routes/ping/index.dart' as ping_index;

import '../routes/_middleware.dart' as middleware;
import '../routes/product/_middleware.dart' as product_middleware;
import '../routes/product/[productId]/_middleware.dart' as product_$product_id_middleware;
import '../routes/ping/_middleware.dart' as ping_middleware;

void main() async {
  final address = InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return entrypoint.run(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/ping', (context) => buildPingHandler()(context))
    ..mount('/product/<productId>', (context,productId,) => buildProduct$productIdHandler(productId,)(context))
    ..mount('/product', (context) => buildProductHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildPingHandler() {
  final pipeline = const Pipeline().addMiddleware(ping_middleware.middleware);
  final router = Router()
    ..all('/', (context) => ping_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildProduct$productIdHandler(String productId,) {
  final pipeline = const Pipeline().addMiddleware(product_middleware.middleware).addMiddleware(product_$product_id_middleware.middleware);
  final router = Router()
    ..all('/', (context) => product_$product_id_index.onRequest(context,productId,));
  return pipeline.addHandler(router);
}

Handler buildProductHandler() {
  final pipeline = const Pipeline().addMiddleware(product_middleware.middleware);
  final router = Router()
    ..all('/', (context) => product_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}

