import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/di/app_providers_module.dart';
import 'package:flutter_template/core/di/di_repository_module.dart';
import 'package:flutter_template/core/di/di_utils_module.dart';
import 'package:get_it/get_it.dart';

abstract class DiProvider {
  @visibleForTesting
  static GetIt get instance => GetIt.instance;

  static Future<void> init() async {
    // Setup app providers have to be done first
    await AppProvidersModule().setupModule(instance);
    UtilsDiModule().setupModule(instance);
    RepositoryDiModule().setupModule(instance);
    await instance.allReady();
  }

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      instance.get(instanceName: instanceName, param1: param1, param2: param2);
}
