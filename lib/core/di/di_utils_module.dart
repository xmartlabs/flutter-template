import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/router/app_status_router_guards.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/core/source/providers/local_shared_preferences_storage.dart';

class UtilsDiModule {
  UtilsDiModule._privateConstructor();

  static final UtilsDiModule _instance = UtilsDiModule._privateConstructor();

  factory UtilsDiModule() => _instance;

  void setupModule(GetIt locator) => locator._setupModule();

  Future<void> setupProviders(GetIt locator) {
    locator._setupProviders();
    return locator.allReady();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupModule() {
    registerLazySingleton(() => AuthenticatedGuard(get()));
    registerLazySingleton(() => UnauthenticatedGuard(get()));
    registerLazySingleton(() => AppRouter(get(), get()));
  }

  void _setupProviders() {
    registerLazySingleton(FlutterSecureStorage.new);
    registerSingletonAsync(() => SharedPreferences.getInstance());

    registerSingletonAsync(
      () async => LocalSharedPreferencesStorage(
        get(),
        await getAsync<SharedPreferences>(),
      ).init(),
    );
  }
}
