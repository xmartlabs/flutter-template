import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:catalog/catalog.dart';

@RoutePage()
class CatalogScaffoldScreen extends StatelessWidget {
  final Widget child;
  final String title;

  const CatalogScaffoldScreen({
    required this.child,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colors.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: context.theme.colors.primary,
            ),
            onPressed: () => context.router.pop(),
          ),
          title: Text(
            title,
            style: TextStyle(color: context.theme.colors.primary),
          ),
        ),
        backgroundColor: context.theme.colors.background,
        body: SafeArea(
          child: SingleChildScrollView(child: Center(child: child)),
        ),
      );
}
