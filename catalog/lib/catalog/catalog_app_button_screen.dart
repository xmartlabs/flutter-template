import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppButtonScreen extends StatelessWidget {
  const CatalogAppButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CatalogScaffoldScreen(
        title: 'Buttons',
        child: Container(),
      );
}
