import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/common/auth_interceptor.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:flutter_template/core/source/project_local_source.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:get_it/get_it.dart';

class RepositoryDiModule {
  RepositoryDiModule._privateConstructor();

  static final RepositoryDiModule _instance =
      RepositoryDiModule._privateConstructor();

  factory RepositoryDiModule() => _instance;

  void setupModule(GetIt locator) {
    locator
      .._setupProvidersAndUtils()
      .._setupSources()
      .._setupRepositories();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupProvidersAndUtils() {
    registerLazySingleton<HttpService>(
      () => HttpServiceDio([AuthInterceptor(get())]),
    );
  }

  void _setupRepositories() {
    registerLazySingleton(() => SessionRepository(get(), get()));
    registerLazySingleton(() => ProjectRepository(get(), get()));
  }

  void _setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
    registerLazySingleton(() => ProjectLocalSource());
    registerLazySingleton(() => ProjectRemoteSource(get()));
  }
}
