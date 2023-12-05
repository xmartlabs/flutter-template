import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_selection_control.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppSelectionControlScreen extends StatelessWidget {
  const CatalogAppSelectionControlScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
        title: 'SELECTION CONTROL',
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _CatalogSelectionControl.values.length,
          itemBuilder: (BuildContext context, int index) {
            final element = _CatalogSelectionControl.values[index];
            return AppSelectionControl(
              isSelected: element.isSelected,
              isRadioButton: element.isRadioButton,
              label: 'Option',
              onPressed: () {},
            );
          },
        ),
      );
}

enum _CatalogSelectionControl {
  radioButtonSelected,
  radioButtonNotSelected,
  checkboxSelected,
  checkboxNotSelected,
}

extension _CatalogScreenExtensions on _CatalogSelectionControl {
  bool get isSelected {
    switch (this) {
      case _CatalogSelectionControl.radioButtonNotSelected:
        return false;
      case _CatalogSelectionControl.radioButtonSelected:
        return true;
      case _CatalogSelectionControl.checkboxNotSelected:
        return false;
      case _CatalogSelectionControl.checkboxSelected:
        return true;
    }
  }

  bool get isRadioButton {
    switch (this) {
      case _CatalogSelectionControl.radioButtonNotSelected:
        return true;
      case _CatalogSelectionControl.radioButtonSelected:
        return true;
      case _CatalogSelectionControl.checkboxNotSelected:
        return false;
      case _CatalogSelectionControl.checkboxSelected:
        return false;
    }
  }
}
