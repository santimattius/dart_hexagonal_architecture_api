import 'package:dart_frog/dart_frog.dart';

import 'caller.dart';

abstract class Controller {
  Future<Response> get(RequestContext context) async {
    throw UnsupportedError('Method Unsupported');
  }

  Future<Response> post(RequestContext context) async {
    throw UnsupportedError('Method Unsupported');
  }

  Future<Response> put(RequestContext context) async {
    throw UnsupportedError('Method Unsupported');
  }

  Future<Response> delete(RequestContext context) async {
    throw UnsupportedError('Method Unsupported');
  }
}

extension ControllerExtension on Controller {
  Map<HttpMethod, Caller> getMethods() {
    return {
      HttpMethod.get: get,
      HttpMethod.post: post,
      HttpMethod.delete: delete,
      HttpMethod.put: put,
    };
  }
}
