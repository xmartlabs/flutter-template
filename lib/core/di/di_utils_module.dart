import 'package:flutter_template/ui/app_router.dart';
import 'package:get_it/get_it.dart';

class UtilsDiModule {
  UtilsDiModule._privateConstructor();

  static final UtilsDiModule _instance = UtilsDiModule._privateConstructor();

  factory UtilsDiModule() {
    return _instance;
  }

  void setupModule(GetIt locator) {
    locator.registerSingleton(AppRouter());
  }
}
