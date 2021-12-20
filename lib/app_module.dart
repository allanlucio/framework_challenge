import 'package:flutter_modular/flutter_modular.dart';

import 'pages/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
        // ModuleRoute("/login", module: AuthModule()),
      ];
}
