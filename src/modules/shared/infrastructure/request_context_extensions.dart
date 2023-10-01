import 'package:dart_frog/dart_frog.dart';

typedef Json = Map<String, dynamic>;

extension RequestContextExtensions on RequestContext {
  Future<Json> asJson() async {
    return await request.json() as Map<String, dynamic>;
  }
}
