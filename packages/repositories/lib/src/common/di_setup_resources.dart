import 'package:get_it/get_it.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/project/project_remote_source.dart';
import 'package:repositories/src/session/auth_local_source.dart';
import 'package:repositories/src/session/auth_remote_source.dart';

extension RepositoriesDiModule on GetIt {
  void setupRepositories() {
    registerLazySingleton(() => SessionRepository(get(), get(), get()));
    registerLazySingleton(() => ProjectRepository(get(), get()));
  }

  void setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
    registerLazySingleton(() => get<AppDatabase>().projectLocalSource);
    registerLazySingleton(() => ProjectRemoteSource(get()));
  }
}
