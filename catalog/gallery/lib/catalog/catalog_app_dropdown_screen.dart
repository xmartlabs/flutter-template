//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_select_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogDropdownScreen extends StatelessWidget {
  const CatalogDropdownScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'DROPDOWN',
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              const AppSelectDropdown<int>(
                label: 'Select',
                items: [
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
