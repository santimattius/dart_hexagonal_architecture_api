import 'package:dart_frog/dart_frog.dart';
import '../src/di/container.dart';
import '../src/modules/healthcheck/health_check_controller.dart';
import '../src/modules/product/infrastructure/controllers/product_controller.dart';

Handler middleware(Handler handler) {
  return inject(handler);
}

Handler inject(Handler handler) {
  return handler
      .use(provideProductGetController())
      .use(provideHealthCheckController());
}

Middleware provideHealthCheckController() {
  return provider<HealthCheckController>(
    (context) => serviceLocator<HealthCheckController>(),
  );
}

Middleware provideProductGetController() {
  return provider<ProductGetController>(
    (context) {
      return serviceLocator<ProductGetController>();
    },
  );
}
