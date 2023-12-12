import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppColorsScreen extends StatelessWidget {
  const CatalogAppColorsScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'COLORS',
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _CatalogColors.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _CatalogColors.values[index];
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: element.color(context),
                    child: Center(
                      child: Text(
                        element.name.toUpperCase(),
                        style: context.theme.textStyles.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
}

enum _CatalogColors {
  primary,
  secondary,
  success,
  info,
  warning,
  danger,
  text,
}

extension _CatalogScreenExtensions on _CatalogColors {
  Color color(BuildContext context) {
    switch (this) {
      case _CatalogColors.primary:
        return context.theme.colors.primary;
      case _CatalogColors.secondary:
        return context.theme.colors.secondary;
      case _CatalogColors.success:
        return context.theme.customColors.success!;
      case _CatalogColors.info:
        return context.theme.customColors.info!;
      case _CatalogColors.warning:
        return context.theme.customColors.warning!;
      case _CatalogColors.danger:
        return context.theme.customColors.danger!;
      case _CatalogColors.text:
        return context.theme.customColors.textColor!;
    }
  }
}
