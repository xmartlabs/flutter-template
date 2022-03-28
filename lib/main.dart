import 'package:flutter/material.dart';
import 'package:flutter_template/ui/splash/splash_screen.dart';

import 'core/services/config.dart';

Future main() async {
  await Config.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
