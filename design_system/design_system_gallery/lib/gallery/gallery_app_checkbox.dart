import 'package:auto_route/auto_route.dart';
import 'package:design_system/widgets/app_checkbox.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryAppCheckboxScreen extends StatelessWidget {
  const GalleryAppCheckboxScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'APP CHECKBOX',
        child: AppCheckbox(
          shrinkWrap: true,
          initialValue: true,
          onPressed: (bool? value) {},
          items: const [
            (value: false, title: 'Option 1', subtitle: null),
            (value: false, title: 'Option 2', subtitle: null),
            (value: false, title: 'Option 3', subtitle: null),
            (value: false, title: 'Option 4', subtitle: null),
            (value: false, title: 'Option 5', subtitle: null),
            (value: false, title: 'Option 6', subtitle: null),
          ],
        ),
      );
}
