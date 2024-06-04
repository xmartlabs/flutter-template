import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:design_system_gallery/router/gallery_router.dart';

@RoutePage()
class GalleryMainScreen extends StatelessWidget {
  const GalleryMainScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'WIDGET CATALOG',
        showBack: false,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: context.theme.colorScheme.primary,
          ),
          itemCount: _GalleryScreen.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _GalleryScreen.values[index];
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

enum _GalleryScreen {
  buttons,
  textFields,
  colors,
  typography,
  dropdown,
  dialog,
  radioButtons,
  checkbox,
}

extension _GalleryScreenExtensions on _GalleryScreen {
  String get title {
    switch (this) {
      case _GalleryScreen.buttons:
        return 'Buttons';
      case _GalleryScreen.textFields:
        return 'Text Fields';
      case _GalleryScreen.colors:
        return 'Colors';
      case _GalleryScreen.typography:
        return 'Typography';
      case _GalleryScreen.dropdown:
        return 'Dropdown';
      case _GalleryScreen.dialog:
        return 'Dialog';
      case _GalleryScreen.radioButtons:
        return 'Radio Buttons';
      case _GalleryScreen.checkbox:
        return 'Checkbox';
    }
  }

  PageRouteInfo<dynamic> get route {
    switch (this) {
      case _GalleryScreen.buttons:
        return const GalleryAppButtonRoute();
      case _GalleryScreen.textFields:
        return const GalleryTextFieldsRoute();
      case _GalleryScreen.colors:
        return const GalleryAppColorsRoute();
      case _GalleryScreen.typography:
        return const GalleryAppTypographyRoute();
      case _GalleryScreen.dropdown:
        return const GalleryDropdownRoute();
      case _GalleryScreen.dialog:
        return const GalleryDialogRoute();
      case _GalleryScreen.radioButtons:
        return const GalleryAppRadioButtonRoute();
      case _GalleryScreen.checkbox:
        return const GalleryAppCheckboxRoute();
    }
  }
}
