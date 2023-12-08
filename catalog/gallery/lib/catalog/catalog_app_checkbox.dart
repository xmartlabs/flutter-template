import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppCheckboxScreen extends StatelessWidget {
  const CatalogAppCheckboxScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'APP CHECKBOX',
        child: AppCheckbox(
          initialValue: true,
          onPressed: (bool? value) {},
          items: const [
            (value: false, label: 'Option 1'),
            (value: false, label: 'Option 2'),
            (value: false, label: 'Option 3'),
            (value: false, label: 'Option 4'),
            (value: false, label: 'Option 5'),
            (value: false, label: 'Option 6'),
          ],
        ),
      );
}
