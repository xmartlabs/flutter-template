import 'package:auto_route/auto_route.dart';
import 'package:design_system/widgets/app_dropdown.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryDropdownScreen extends StatelessWidget {
  const GalleryDropdownScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'DROPDOWN',
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppDropdownMenu<int>(
                initialValue: 1,
                dropdownMenuEntries: const [
                  (value: 1, label: 'Option 1'),
                  (value: 2, label: 'Option 2'),
                  (value: 3, label: 'Option 3'),
                  (value: 4, label: 'Option 4'),
                  (value: 5, label: 'Option 5'),
                  (value: 6, label: 'Option 6'),
                ],
                onSelected: (int? value) {},
              ),
            ],
          ),
        ),
      );
}
