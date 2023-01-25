import 'package:flutter_template/ui/app_router.dart';
import 'package:get_it/get_it.dart';

class UtilsDiModule {
  UtilsDiModule._privateConstructor();

  static final UtilsDiModule _instance = UtilsDiModule._privateConstructor();

  factory UtilsDiModule() => _instance;

  Future<void> setupModule(GetIt locator) async {
    locator._setupModule();
    await locator.allReady();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupModule() {
    registerSingleton(AppRouter());
  }
}
