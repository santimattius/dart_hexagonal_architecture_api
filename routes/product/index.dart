import 'package:dart_frog/dart_frog.dart';

import '../../src/modules/shared/infrastructure/request_resolver.dart';

Future<Response> onRequest(RequestContext context) async =>
    onRequestResolver(context);
