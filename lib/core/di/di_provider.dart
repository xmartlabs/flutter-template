import 'package:flutter_template/core/di/di_utils_module.dart';
import 'package:get_it/get_it.dart';

import 'di_repository_module.dart';

abstract class DiProvider {
  static bool _initialized = false;

  static GetIt get _instance {
    final instance = GetIt.instance;
    if (!_initialized) {
      RepositoryDiModule().setupModule(instance);
      UtilsDiModule().setupModule(instance);
      _initialized = true;
    }

    return instance;
  }

  static Future<void> init() => _instance.allReady();

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _instance.get(instanceName: instanceName, param1: param1, param2: param2);
}
