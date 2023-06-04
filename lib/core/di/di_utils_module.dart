import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/router/app_router_guards.dart';
import 'package:flutter_template/ui/router/auth_router_provider.dart';
import 'package:get_it/get_it.dart';

class UtilsDiModule {
  UtilsDiModule._privateConstructor();

  static final UtilsDiModule _instance = UtilsDiModule._privateConstructor();

  factory UtilsDiModule() => _instance;

  void setupModule(GetIt locator) => locator._setupModule();
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupModule() {
    registerLazySingleton(() => AuthenticatedGuard(get()));
    registerLazySingleton(() => UnauthenticatedGuard(get()));
    registerLazySingleton(() => AuthRouterProvider(get()));
    registerLazySingleton(() => AppRouter(get(), get()));
  }
}
