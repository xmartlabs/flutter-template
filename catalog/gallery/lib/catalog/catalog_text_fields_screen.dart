//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogTextFieldsScreen extends StatelessWidget {
  const CatalogTextFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final labelTextController = TextEditingController();
    return CatalogScaffold(
        title: 'TEXT FIELDS',
        child: Container(
          margin: const EdgeInsets.all(20),
          child: AppTextField(
            controller: labelTextController,
            labelText: 'Label',
            helperText: 'Helper text',
            hintText: 'Text',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      );
  }
}
