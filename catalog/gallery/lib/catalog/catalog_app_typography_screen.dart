import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppTypographyScreen extends StatelessWidget {
  const CatalogAppTypographyScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'Typography',
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _CatalogTypography.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _CatalogTypography.values[index];
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      element.name,
                      style: element
                          .textStyle(context)
                          .copyWith(color: context.theme.colors.textColor),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
}

enum _CatalogTypography {
  headingLarge,
  headingMedium,
  headingSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  bodyXSmall,
  buttonXLarge,
  buttonLarge,
  buttonMedium,
  buttonSmall,
  buttonXSmall,
}

extension _CatalogScreenExtensions on _CatalogTypography {
  TextStyle textStyle(BuildContext context) {
    switch (this) {
      case _CatalogTypography.headingLarge:
        return context.theme.textStyles.headlineLarge!;
      case _CatalogTypography.headingMedium:
        return context.theme.textStyles.headlineMedium!;
      case _CatalogTypography.headingSmall:
        return context.theme.textStyles.headlineSmall!;
      case _CatalogTypography.labelLarge:
        return context.theme.textStyles.labelLarge!;
      case _CatalogTypography.labelMedium:
        return context.theme.textStyles.labelMedium!;
      case _CatalogTypography.labelSmall:
        return context.theme.textStyles.labelSmall!;
      case _CatalogTypography.bodyLarge:
        return context.theme.textStyles.bodyLarge!;
      case _CatalogTypography.bodyMedium:
        return context.theme.textStyles.bodyMedium!;
      case _CatalogTypography.bodySmall:
        return context.theme.textStyles.bodySmall!;
      case _CatalogTypography.bodyXSmall:
        return context.theme.textStyles.bodyXSmall;
      case _CatalogTypography.buttonXSmall:
        return context.theme.textStyles.buttonXSmall;
      case _CatalogTypography.buttonLarge:
        return context.theme.textStyles.buttonLarge;
      case _CatalogTypography.buttonMedium:
        return context.theme.textStyles.buttonMedium;
      case _CatalogTypography.buttonSmall:
        return context.theme.textStyles.buttonSmall;
      case _CatalogTypography.buttonXLarge:
        return context.theme.textStyles.buttonXLarge;
    }
  }
}
