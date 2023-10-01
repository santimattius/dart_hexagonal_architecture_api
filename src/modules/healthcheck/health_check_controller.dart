import 'package:dart_frog/dart_frog.dart';

import '../shared/infrastructure/Controller.dart';

class HealthCheckController extends Controller {
  @override
  Future<Response> get(RequestContext context) async {
    return Response(body: 'pong');
  }
}
