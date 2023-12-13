import 'package:common/config.dart';
import 'package:get_it/get_it.dart';
import 'package:services/networking.dart';

extension GetItDiServiceExtensions on GetIt {
  void setupHttpService() {
    registerLazySingleton<HttpService>(
      () => HttpServiceDio(
        [],
        Config.apiBaseUrl,
        Config.supabaseApiKey,
      ),
    );
  }
}
