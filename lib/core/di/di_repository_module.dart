import 'package:common/config.dart';
import 'package:get_it/get_it.dart';
import 'package:repositories/repositories.dart';
import 'package:services/networking.dart';

class RepositoryDiModule {
  RepositoryDiModule._privateConstructor();

  static final RepositoryDiModule _instance =
      RepositoryDiModule._privateConstructor();

  factory RepositoryDiModule() => _instance;

  void setupModule(GetIt locator) {
    locator
      .._setupProvidersAndUtils()
      ..setupSources()
      ..setupRepositories()
      .._setupInterceptors();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupProvidersAndUtils() {
    registerLazySingleton(
      () => HttpServiceDio([], Config.apiBaseUrl, Config.supabaseApiKey),
    );
  }

  void _setupInterceptors() {
    final httpService = get<HttpServiceDio>();
    final sessionRepository = get<SessionRepository>();
    httpService.addInterceptors([
      AuthInterceptor(
        () => sessionRepository.userToken.first,
        sessionRepository.logOut,
      ),
    ]);
  }
}
