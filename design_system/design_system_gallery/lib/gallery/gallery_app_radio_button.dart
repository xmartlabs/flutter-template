import 'package:auto_route/auto_route.dart';
import 'package:design_system/widgets/app_radio_button.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryAppRadioButtonScreen extends StatelessWidget {
  const GalleryAppRadioButtonScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'APP RADIO BUTTON',
        child: AppRadioButton(
          initialValue: 1,
          onPressed: (int? value) {},
          items: const [
            (value: 1, label: 'Option 1'),
            (value: 2, label: 'Option 2'),
            (value: 3, label: 'Option 3'),
            (value: 4, label: 'Option 4'),
            (value: 5, label: 'Option 5'),
            (value: 6, label: 'Option 6'),
          ],
        ),
      );
}
