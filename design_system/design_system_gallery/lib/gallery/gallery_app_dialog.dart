import 'package:auto_route/auto_route.dart';
import 'package:design_system/widgets/app_dialog.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryDialogScreen extends StatelessWidget {
  const GalleryDialogScreen({super.key});

  @override
  Widget build(BuildContext context) => const GalleryScaffold(
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
