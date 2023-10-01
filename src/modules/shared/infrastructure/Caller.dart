import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'Controller.dart';

typedef Caller = Future<Response> Function(RequestContext);

Caller callResolver<C extends Controller>(RequestContext context) {
  final controller = context.read<C>();
  final methods = controller.getMethods();
  final caller = methods[context.request.method];
  if (caller == null) return notFound;
  return caller;
}

Future<Response> notFound(RequestContext context) async {
  return Response(statusCode: HttpStatus.notFound);
}
