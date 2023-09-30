import 'package:dart_frog/dart_frog.dart';
import '../src/modules/healthcheck/HealthCheckController.dart';

Handler middleware(Handler handler) {
  return handler.use(provideHealthCheckController());
}

Middleware provideHealthCheckController() {
  return provider<HealthCheckController>((context) => HealthCheckController());
}
