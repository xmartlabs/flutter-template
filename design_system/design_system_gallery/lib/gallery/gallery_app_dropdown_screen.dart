//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:design_system/widgets/app_select_dropdown.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              SizedBox(height: 30.h),
              AppSelectDropdown<int>(
                label: 'Select',
                items: const [
                  (value: 1, label: 'Option 1'),
                  (value: 2, label: 'Option 2'),
                  (value: 3, label: 'Option 3'),
                  (value: 4, label: 'Option 4'),
                  (value: 5, label: 'Option 5'),
                  (value: 6, label: 'Option 6'),
                ],
                onChanged: (int? value) {},
              ),
            ],
          ),
        ),
      );
}
