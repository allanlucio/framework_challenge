import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/cart_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/product_page.dart';

class FruitShopModule extends Module {
  @override
  List<Bind<Object>> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const HomePage()),
        ChildRoute(
          "/product",
          child: (context, args) => ProductPage(product: args.data),
        ),
        ChildRoute(
          "/cart",
          child: (context, args) => CartPage(),
        ),
      ];
}
