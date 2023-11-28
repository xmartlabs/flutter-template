import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';
import 'package:gallery/router/catalog_router.dart';

@RoutePage()
class CatalogMainScreen extends StatelessWidget {
  const CatalogMainScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'WIDGET CATALOG',
        showBack: false,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: context.theme.colors.primary,
          ),
          itemCount: _CatalogScreen.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _CatalogScreen.values[index];
            return Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(element.title.toUpperCase()),
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
  colors,
  typography,
  dropdown,
}

extension _CatalogScreenExtensions on _CatalogScreen {
  String get title {
    switch (this) {
      case _CatalogScreen.buttons:
        return 'Buttons';
      case _CatalogScreen.textFields:
        return 'Text Fields';
      case _CatalogScreen.colors:
        return 'Colors';
      case _CatalogScreen.typography:
        return 'Typography';
      case _CatalogScreen.dropdown:
        return 'Dropdown';
    }
  }

  PageRouteInfo<dynamic> get route {
    switch (this) {
      case _CatalogScreen.buttons:
        return const CatalogAppButtonRoute();
      case _CatalogScreen.textFields:
        return const CatalogTextFieldsRoute();
      case _CatalogScreen.colors:
        return const CatalogAppColorsRoute();
      case _CatalogScreen.typography:
        return const CatalogAppTypographyRoute();
      case _CatalogScreen.dropdown:
        return const CatalogDropdownRoute();
    }
  }
}
