import 'package:dart_frog/dart_frog.dart';

import 'caller.dart';

Future<Response> onRequestResolver(RequestContext context) async {
  try {
    final caller = context.read<Caller>();
    return await caller.call(context);
  } catch (_) {
    return notFound(context);
  }
}
