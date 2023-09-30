import 'package:dart_frog/dart_frog.dart';

import 'Controller.dart';

typedef Caller = Future<Response> Function(RequestContext);

Caller callResolver<C extends Controller>(RequestContext context) {
  final controller = context.read<C>();
  final methods = controller.getMethods();
  final caller = methods[context.request.method];
  if (caller == null) throw UnsupportedError('Method not supported');
  return caller;
}
