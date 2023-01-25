import 'package:flutter_template/core/source/common/app_database.dart';
import 'package:get_it/get_it.dart';

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
  }
}
