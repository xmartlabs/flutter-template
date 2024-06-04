import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryAppColorsScreen extends StatelessWidget {
  const GalleryAppColorsScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'COLORS',
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _GalleryColors.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _GalleryColors.values[index];
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

enum _GalleryColors {
  primary,
  secondary,
  success,
  info,
  warning,
  danger,
  text,
}

extension _GalleryScreenExtensions on _GalleryColors {
  Color color(BuildContext context) {
    switch (this) {
      case _GalleryColors.primary:
        return context.theme.colorScheme.primary;
      case _GalleryColors.secondary:
        return context.theme.colorScheme.secondary;
      case _GalleryColors.success:
        return context.theme.customColors.success!;
      case _GalleryColors.info:
        return context.theme.customColors.info!;
      case _GalleryColors.warning:
        return context.theme.customColors.warning!;
      case _GalleryColors.danger:
        return context.theme.customColors.danger!;
      case _GalleryColors.text:
        return context.theme.customColors.textColor!;
    }
  }
}
