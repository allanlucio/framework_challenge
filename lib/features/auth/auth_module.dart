import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'external/datasources/fake_remote_auth_datasource_impl.dart';
import 'infra/datasources/remote_auth_datasource.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/store/auth_cubit/auth_cubit.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => AuthCubit(
                  loginUsecase: i(),
                ),
            export: true),
        Bind.lazySingleton<Login>(
          (i) => LoginImpl(
            authRepository: i(),
          ),
          export: true,
        ),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(remoteDataSource: i()),
          export: true,
        ),
        Bind.lazySingleton<RemoteAuthDataSource>(
          (i) => FakeRemoteAuthDataSourceImpl(),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => LoginPage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
