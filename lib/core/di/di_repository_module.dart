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

  factory RepositoryDiModule() => _instance;

  void setupModule(GetIt locator) {
    locator._setupProvidersAndUtils();
    locator._setupSources();
    locator._setupRepositories();
  }
}

extension _GetItUseCaseDiModuleExtensions on GetIt {
  void _setupProvidersAndUtils() {
    registerLazySingleton(FlutterSecureStorage.new);
    // TODO: Add interceptors
    registerLazySingleton(() => HttpServiceDio([]));
  }

  void _setupRepositories() {
    registerLazySingleton(() => SessionRepository(get(), get()));
  }

  void _setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
  }
}
