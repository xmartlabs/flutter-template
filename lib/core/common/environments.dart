import 'package:flutter_template/core/common/config.dart';

enum Environments {
  dev,
  staging,
  prod,
}

extension EnvironmentPath on Environments {
  String get fileName => switch (this) {
        Environments.dev => 'dev',
        Environments.staging => 'staging',
        Environments.prod => 'prod',
      };

  String get path => '${Config.environmentFolder}/$fileName';
}
