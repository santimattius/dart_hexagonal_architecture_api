import 'package:get_it/get_it.dart';

import '../modules/healthcheck/health_check_controller.dart';
import '../modules/product/application/product_catalog.dart';
import '../modules/product/application/product_creator.dart';
import '../modules/product/application/product_searcher.dart';
import '../modules/product/domain/product_repository.dart';
import '../modules/product/infrastructure/controllers/product_controller.dart';
import '../modules/product/infrastructure/in_memory_product_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> reset() => serviceLocator.reset();

void inject() {
  serviceLocator
    ..registerFactory(
      HealthCheckController.new,
    )
    ..registerLazySingleton<ProductRepository>(InMemoryProductRepository.new)
    ..registerFactory(
      () => ProductSearcher(repository: serviceLocator<ProductRepository>()),
    )
    ..registerFactory(
      () => ProductCatalog(repository: serviceLocator<ProductRepository>()),
    )
    ..registerFactory(
      () => ProductCreator(repository: serviceLocator<ProductRepository>()),
    )
    ..registerFactory(
      () => ProductGetController(
        productSearcher: serviceLocator<ProductSearcher>(),
        productCatalog: serviceLocator<ProductCatalog>(),
        productCreator: serviceLocator<ProductCreator>(),
      ),
    );
}
