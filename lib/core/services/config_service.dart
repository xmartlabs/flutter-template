import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environments {
  development,
  staging,
  production,
}

class ConfigService {
  String? apiBaseUrl;

  ConfigService() {
    apiBaseUrl = DotEnv().env['API_BASE_URL'];
  }
}
