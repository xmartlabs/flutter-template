import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:catalog/catalog.dart';

class CatalogScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool? showBack;

  const CatalogScaffold({
    required this.child,
    required this.title,
    this.showBack = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colors.background,
          leading: showBack ?? true
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.theme.colors.primary,
                  ),
                  onPressed: () => context.router.pop(),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(color: context.theme.colors.primary),
          ),
        ),
        backgroundColor: context.theme.colors.background,
        body: SafeArea(
          child: child,
        ),
      );
}
