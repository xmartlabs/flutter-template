import 'package:catalog/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/router/catalog_router.dart';

void main() {
  runApp(MyApp(CatalogRouter()));
}

class MyApp extends StatelessWidget {
  final CatalogRouter _router;

  const MyApp(this._router, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, __) => _CatalogAppContentScreen(_router),
      );
}

class _CatalogAppContentScreen extends StatelessWidget {
  final CatalogRouter _router;

  const _CatalogAppContentScreen(this._router, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: AppTheme.provideAppTheme(context),
        routerConfig: _router.config(),
        builder: (context, child) {
          return child!;
        },
      );
}
