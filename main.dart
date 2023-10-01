import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'src/di/container.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  await reset();
  inject();
  return serve(handler, ip, port);
}
