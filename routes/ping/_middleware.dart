import 'package:dart_frog/dart_frog.dart';

import '../../src/modules/healthcheck/health_check_controller.dart';
import '../../src/modules/shared/infrastructure/caller.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<Caller>((context) => callResolver<HealthCheckController>(context)),
  );
}
