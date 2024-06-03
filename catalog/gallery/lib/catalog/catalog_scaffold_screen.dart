import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:catalog/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

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
          leading: showBack ?? true
              ? IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: context.theme.colorScheme.primary.getShade(100),
                  ),
                  onPressed: () => context.router.maybePop(),
                )
              : null,
          title: Text(title),
        ),
        backgroundColor: context.theme.customColors.textColor!.getShade(100),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      );
}
