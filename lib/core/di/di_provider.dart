import 'package:flutter_template/core/di/app_providers_module.dart';
import 'package:flutter_template/core/di/di_repository_module.dart';
import 'package:flutter_template/core/di/di_utils_module.dart';
import 'package:get_it/get_it.dart';

abstract class DiProvider {
  static GetIt get _instance => GetIt.instance;

  static Future<void> init() async {
    // Setup app providers have to be done first
    await AppProvidersModule().setupModule(_instance);
    UtilsDiModule().setupModule(_instance);
    RepositoryDiModule().setupModule(_instance);
    await _instance.allReady();
  }

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _instance.get(instanceName: instanceName, param1: param1, param2: param2);
}
