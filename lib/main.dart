import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/ui/splash/splash_screen.dart';

Future main() async {
  await runZonedGuarded(() async {
    await _initSdks();
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Logger.fatal(error: exception, stackTrace: stackTrace);
  });
}

Future _initSdks() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Logger.init();
  await Config.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
