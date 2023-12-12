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
