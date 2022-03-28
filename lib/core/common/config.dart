import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/core/common/enum_helpers.dart';

enum Environments {
  development,
  staging,
  production,
}

extension EnviromentPath on Environments {
  String get fileName {
    switch (this) {
      case Environments.development:
        return 'development.env';
      case Environments.staging:
        return 'staging.env';
      case Environments.production:
        return 'production.env';
    }
  }

  String get path => 'assets/environments/' + fileName;
}

abstract class Config {
  static late String apiBaseUrl;

  static final _environment = enumFromString(
          Environments.values, const String.fromEnvironment('ENV')) ??
      Environments.development;

  static Future<void> initialize() async {
    await _setupEnv();
    _initializeEnvVariables();
  }

  static void _initializeEnvVariables() {
    apiBaseUrl = dotenv.env['API_BASE_URL']!;
  }

  static Future<void> _setupEnv() async {
    await dotenv.load(fileName: _environment.path);
  }
}
