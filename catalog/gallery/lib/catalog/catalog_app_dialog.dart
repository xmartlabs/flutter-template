//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogDialogScreen extends StatelessWidget {
  const CatalogDialogScreen({super.key});

  @override
  Widget build(BuildContext context) => const CatalogScaffold(
        title: 'DIALOG',
        child: AppDialog(
          title: 'Modal title',
          content: 'This is place holder text. The basic dialog for modals '
              'should contain only valuable and relevant information. Simplify '
              'dialogs by removing unnecessary elements or content that does '
              'not support user tasks. If you find that the number of required '
              'elements for your design are making ',
          cancelButtonText: 'Cancel',
          actionButtonText: 'Confirm',
        ),
      );
}
