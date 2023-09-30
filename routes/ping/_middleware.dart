import 'package:dart_frog/dart_frog.dart';

import '../../src/modules/healthcheck/HealthCheckController.dart';
import '../../src/modules/shared/infrastructure/Caller.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<Caller>((context) => callResolver<HealthCheckController>(context)),
  );
}
