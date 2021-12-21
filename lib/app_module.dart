import 'package:flutter_modular/flutter_modular.dart';

import 'features/fruit_shop/domain/repositories/product_repository.dart';
import 'features/fruit_shop/domain/services/print_cart_invoice_service.dart';
import 'features/fruit_shop/domain/usecases/search_products/print_cart_invoice_usecase.dart';
import 'features/fruit_shop/domain/usecases/search_products/print_cart_invoice_usecase_impl.dart';
import 'features/fruit_shop/domain/usecases/search_products/search_product_usecase.dart';
import 'features/fruit_shop/domain/usecases/search_products/search_product_usecase_impl.dart';
import 'features/fruit_shop/external/datasources/cart_invoice_datasource_impl.dart';
import 'features/fruit_shop/external/datasources/local_product_datasource.dart';
import 'features/fruit_shop/fruit_shop_module.dart';
import 'features/fruit_shop/infra/datasources/print_cart_invoice_data_source.dart';
import 'features/fruit_shop/infra/datasources/product_datasource.dart';
import 'features/fruit_shop/infra/repositories/product_repository_impl.dart';
import 'features/fruit_shop/infra/services/print_cart_invoice_service_impl.dart';
import 'features/fruit_shop/presentation/stores/cart/cart_bloc.dart';
import 'features/fruit_shop/presentation/stores/products/products_bloc.dart';
import 'pages/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<ProductDataSource>((i) => LocalProductDataSource()),
        Bind.lazySingleton<CartInvoiceDataSource>(
            (i) => CartInvoiceDataSourceImpl()),
        Bind.lazySingleton<ProductRepository>(
            (i) => ProductRepositoryImpl(dataSource: i())),
        Bind.lazySingleton<PrintCartInvoiceService>(
            (i) => PrintCartInvoiceServiceImpl(dataSource: i())),
        Bind.lazySingleton<SearchProductUseCase>(
            (i) => SearchProductUseCaseImpl(repository: i())),
        Bind.lazySingleton<PrintCartInvoiceUsecase>(
            (i) => PrintCartInvoiceUsecaseImpl(service: i())),
        Bind.factory<ProductsBloc>((i) => ProductsBloc(usecase: i())),
        Bind.singleton<CartBloc>((i) => CartBloc(printCartUsecase: i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
        ModuleRoute("/fruit_shop", module: FruitShopModule()),
        // ModuleRoute("/login", module: AuthModule()),
      ];
}
