import 'package:dart_frog/dart_frog.dart';

import 'Caller.dart';

Future<Response> onRequestResolver(RequestContext context) async {
  final caller = context.read<Caller>();
  return caller.call(context);
}
