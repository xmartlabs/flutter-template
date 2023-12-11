import 'package:common/config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:services/networking.dart';

extension GetItDiServiceExtensions on GetIt {
  void setupHttpService() {
    registerLazySingleton(
      () => HttpServiceDio(
        Dio(
          BaseOptions(
            baseUrl: Config.apiBaseUrl,
            headers: {'apikey': Config.supabaseApiKey},
            contentType: Headers.jsonContentType,
          ),
        ),
      ),
    );
  }
}
