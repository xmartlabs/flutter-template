import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_system_gallery/router/gallery_router.dart';

void main() {
  runApp(MyApp(GalleryRouter()));
}

class MyApp extends StatelessWidget {
  final GalleryRouter _router;

  const MyApp(this._router, {super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, __) => _GalleryAppContentScreen(_router),
      );
}

class _GalleryAppContentScreen extends StatelessWidget {
  final GalleryRouter _router;

  const _GalleryAppContentScreen(this._router);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: AppTheme.provideAppTheme(context),
        routerConfig: _router.config(),
        builder: (context, child) => child!,
      );
}
