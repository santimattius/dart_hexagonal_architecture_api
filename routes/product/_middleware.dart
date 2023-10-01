import 'package:dart_frog/dart_frog.dart';

import '../../src/modules/product/infrastructure/controllers/product_controller.dart';
import '../../src/modules/shared/infrastructure/caller.dart';
import '../_middleware.dart';

Handler middleware(Handler handler) {
  return inject(handler).use(
    provider<Caller>((context) {
      return callResolver<ProductGetController>(context);
    }),
  );
}
