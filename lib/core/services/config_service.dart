import 'package:flutter_dotenv/flutter_dotenv.dart';

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

class ConfigService {
  String? apiBaseUrl;

  ConfigService() {
    apiBaseUrl = DotEnv().env['API_BASE_URL'];
  }
}
