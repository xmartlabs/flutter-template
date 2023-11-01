//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'catalog_scaffold_screen.dart';

@RoutePage()
class CatalogTextFieldsScreen extends StatelessWidget {
  const CatalogTextFieldsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CatalogScaffoldScreen(
        title: 'TextFields',
        child: Container(),
      );
}
