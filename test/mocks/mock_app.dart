import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/http_service.dart';
import 'services/path_provider.dart';
import 'sources/secure_storage.dart';

class SimpleTesteableApp extends MyApp {
  final Map<ApiOverrideKey, ResponseData>? apiOverrides;

  final String initialRoute;
  const SimpleTesteableApp._({
    this.apiOverrides,
    this.initialRoute = '/',
  }) : super();

  static Future<SimpleTesteableApp> getUnauthenticatedApp({
    Map<ApiOverrideKey, ResponseData>? apiOverrides,
    String initialRoute = '/',
    Map<String, String>? secureStorageData,
    Map<String, Object>? sharedPreferencesData,
  }) async {
    await _initMockSdks(
      apiOverrides: apiOverrides,
      initialRoute: initialRoute,
      sharedPreferenceData: secureStorageData,
      secureStorageData: secureStorageData,
    );
    final app = SimpleTesteableApp._(
      apiOverrides: apiOverrides,
      initialRoute: initialRoute,
    );
    return app;
  }
}

Future<void> _initMockSdks({
  Map<ApiOverrideKey, ResponseData>? apiOverrides,
  Map<String, String>? secureStorageData,
  Map<String, Object>? sharedPreferenceData,
  String? initialRoute,
}) async {
  _initializeLocalSources(
    secureStorageData: secureStorageData,
    sharedPreferenceData: sharedPreferenceData,
  );
  await _initializeProviders(apiOverrides, initialRoute);
  await Logger.init();
  await Config.initialize();
  Hive.init(Config.appDirectoryPath);
}

void _initializeLocalSources({
  Map<String, String>? secureStorageData,
  Map<String, Object>? sharedPreferenceData,
}) {
  FakeFlutterSecureStorage.setInitialData(secureStorageData ?? {});
  PathProviderPlatform.instance = FakePathProviderPlatform();
  SharedPreferences.setMockInitialValues(sharedPreferenceData ?? {});
}

Future<void> _initializeProviders(
  Map<ApiOverrideKey, ResponseData>? apiOverrides,
  String? initialRoute,
) async {
  await DiProvider.init();
  DiProvider.instance
    ..allowReassignment = true
    ..registerLazySingleton<FlutterSecureStorage>(
      () => FakeFlutterSecureStorage(),
    )
    ..registerLazySingleton<HttpService>(
      () => FakeHttpService()..mockApi(apiOverrides ?? {}),
    )
    ..registerLazySingleton<AppRouter>(
      () => AppRouter(
        initialRoute: initialRoute,
        sessionRepository: DiProvider.get(),
      ),
    );
}
