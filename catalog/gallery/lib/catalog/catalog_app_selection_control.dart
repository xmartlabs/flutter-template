import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_selection_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppSelectionControlScreen extends StatelessWidget {
  const CatalogAppSelectionControlScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'SELECTION CONTROL',
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppSelectionControl(
                isSelected: true,
                label: 'Option',
                onPressed: () {},
              ),
              SizedBox(height: 10.h),
              AppSelectionControl(
                isSelected: false,
                label: 'Option',
                onPressed: () {},
              ),
              SizedBox(height: 10.h),
              AppSelectionControl(
                isSelected: false,
                label: 'Option',
                onPressed: () {},
                isRadioButton: false,
              ),
              SizedBox(height: 10.h),
              AppSelectionControl(
                isSelected: true,
                label: 'Option',
                isRadioButton: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
