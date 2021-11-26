import 'package:flutter_template/core/di/di_use_case_module.dart';
import 'package:flutter_template/core/di/di_utils_module.dart';
import 'package:get_it/get_it.dart';

import 'di_repository_module.dart';

abstract class DiProvider {
  static bool _initialized = false;

  static GetIt get instance {
    final instance = GetIt.instance;
    if (!_initialized) {
      RepositoryDiModule().setupModule(instance);
      UseCaseDiModule().setupModule(instance);
      UtilsDiModule().setupModule(instance);
      _initialized = true;
    }

    return instance;
  }
}
