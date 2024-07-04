import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';

@RoutePage()
class GalleryAppTypographyScreen extends StatelessWidget {
  const GalleryAppTypographyScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'TYPOGRAPHY',
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _GalleryTypography.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _GalleryTypography.values[index];
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      element.name.toUpperCase(),
                      style: element.textStyle(context).copyWith(
                            color: context.theme.customColors.textColor,
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

enum _GalleryTypography {
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

extension _GalleryScreenExtensions on _GalleryTypography {
  TextStyle textStyle(BuildContext context) {
    switch (this) {
      case _GalleryTypography.headingLarge:
        return context.theme.textStyles.headlineLarge!;
      case _GalleryTypography.headingMedium:
        return context.theme.textStyles.headlineMedium!;
      case _GalleryTypography.headingSmall:
        return context.theme.textStyles.headlineSmall!;
      case _GalleryTypography.labelLarge:
        return context.theme.textStyles.labelLarge!;
      case _GalleryTypography.labelMedium:
        return context.theme.textStyles.labelMedium!;
      case _GalleryTypography.labelSmall:
        return context.theme.textStyles.labelSmall!;
      case _GalleryTypography.bodyLarge:
        return context.theme.textStyles.bodyLarge!;
      case _GalleryTypography.bodyMedium:
        return context.theme.textStyles.bodyMedium!;
      case _GalleryTypography.bodySmall:
        return context.theme.textStyles.bodySmall!;
      case _GalleryTypography.bodyXSmall:
        return context.theme.customTextStyles.bodyXSmall;
      case _GalleryTypography.buttonXSmall:
        return context.theme.customTextStyles.buttonXSmall;
      case _GalleryTypography.buttonLarge:
        return context.theme.customTextStyles.buttonLarge;
      case _GalleryTypography.buttonMedium:
        return context.theme.customTextStyles.buttonMedium;
      case _GalleryTypography.buttonSmall:
        return context.theme.customTextStyles.buttonSmall;
      case _GalleryTypography.buttonXLarge:
        return context.theme.customTextStyles.buttonXLarge;
    }
  }
}
