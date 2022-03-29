import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:get_it/get_it.dart';

class RepositoryDiModule {
  RepositoryDiModule._privateConstructor();

  static final RepositoryDiModule _instance =
      RepositoryDiModule._privateConstructor();

  factory RepositoryDiModule() {
    return _instance;
  }

  void setupModule(GetIt locator) {
    _setupProvidersAndUtils(locator);
    _setupSources(locator);
    _setupRepositories(locator);
  }

  void _setupProvidersAndUtils(GetIt locator) {
    locator.registerLazySingleton(FlutterSecureStorage.new);
    // TODO: Add interceptors
    locator.registerLazySingleton(() => HttpServiceDio([]));
  }

  void _setupRepositories(GetIt locator) {
    locator.registerLazySingleton(
        () => SessionRepository(locator.get(), locator.get()));
  }

  void _setupSources(GetIt locator) {
    locator.registerLazySingleton(() => AuthLocalSource(locator.get()));
    locator.registerLazySingleton(() => AuthRemoteSource(locator.get()));
  }
}
