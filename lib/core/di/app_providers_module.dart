import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/source/common/app_database.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/core/source/common/local_shared_preferences_storage.dart';

class AppProvidersModule {
  AppProvidersModule._privateConstructor();

  static final AppProvidersModule _instance =
      AppProvidersModule._privateConstructor();

  factory AppProvidersModule() => _instance;

  Future<void> setupModule(GetIt locator) async {
    locator._setupModule();
    await locator.allReady();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupModule() {
    registerSingletonAsync(
      () => $FloorAppDatabase.databaseBuilder('app_database.db').build(),
    );
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
