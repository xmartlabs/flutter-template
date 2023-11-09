import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:gallery/router/catalog_router.dart';

@RoutePage()
class CatalogMainScreen extends StatelessWidget {
  const CatalogMainScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.background,
        appBar: AppBar(
          backgroundColor: context.theme.colors.background,
          centerTitle: true,
          title: Text(
            'Widget Catalog',
            style: context.theme.textStyles.labelLarge?.copyWith(
              color: context.theme.colors.primary,
            ),
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _CatalogScreen.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _CatalogScreen.values[index];
            return Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(element.title),
                    onPressed: () => context.router.push(element.route),
                  ),
                ),
              ],
            );
          },
        ),
      );
}

enum _CatalogScreen {
  buttons,
  textFields,
}

extension _CatalogScreenExtensions on _CatalogScreen {
  String get title {
    switch (this) {
      case _CatalogScreen.buttons:
        return 'Buttons';
      case _CatalogScreen.textFields:
        return 'Text Fields';
    }
  }

  PageRouteInfo<dynamic> get route {
    switch (this) {
      case _CatalogScreen.buttons:
        return const CatalogAppButtonRoute();
      case _CatalogScreen.textFields:
        return const CatalogTextFieldsRoute();
    }
  }
}
