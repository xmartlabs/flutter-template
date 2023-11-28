//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_dropdown.dart';
import 'package:catalog/widgets/app_dropdown_multiple_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

@RoutePage()
class CatalogDropdownScreen extends StatelessWidget {
  const CatalogDropdownScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      CatalogScaffold(
        title: 'DROPDOWN',
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppDropdownMenu<int>(
                initialValue: 1,
                dropdownMenuEntries: const [
                  AppDropdownMenuEntry(value: 1, label: 'Option 1'),
                  AppDropdownMenuEntry(value: 2, label: 'Option 2'),
                  AppDropdownMenuEntry(value: 3, label: 'Option 3'),
                  AppDropdownMenuEntry(value: 4, label: 'Option 4'),
                  AppDropdownMenuEntry(value: 5, label: 'Option 5'),
                  AppDropdownMenuEntry(value: 6, label: 'Option 6'),
                ],
                onSelected: (int? value) {},
              ),
              SizedBox(height: 10.h),
              AppDropdownMultipleChoice<int>(
                dropdownMenuEntries: [
                  MultiSelectItem(1, 'Option 1'),
                  MultiSelectItem(2, 'Option 2'),
                  MultiSelectItem(3, 'Option 3'),
                  MultiSelectItem(4, 'Option 4'),
                ], onSelect: (List<int> list ) { },
              ),
            ],
          ),
        ),
      );
}
