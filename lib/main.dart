import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/common/enum_helpers.dart';
import 'core/services/config_service.dart';

Future main() async {
  final environment =
      enumFromString(Environments.values, const String.fromEnvironment('ENV')) ??
          Environments.development;
  await dotenv.load(fileName: environment.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
