import 'package:flutter_template/core/common/config.dart';

enum Environments {
  dev,
  staging,
  prod,
}

extension EnviromentPath on Environments {
  String get fileName {
    switch (this) {
      case Environments.dev:
        return 'dev';
      case Environments.staging:
        return 'staging';
      case Environments.prod:
        return 'prod';
    }
  }

  String get path => '${Config.environmentFolder}/$fileName';
}
