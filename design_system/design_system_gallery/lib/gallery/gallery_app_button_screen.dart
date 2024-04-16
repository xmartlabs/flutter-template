import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/theme/app_buttons.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class GalleryAppButtonScreen extends StatelessWidget {
  const GalleryAppButtonScreen({super.key});

  @override
  Widget build(BuildContext context) => GalleryScaffold(
        title: 'BUTTONS',
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () => {},
                child: const Text('PRIMARY FILLED BUTTON'),
              ),
              SizedBox(height: 10.h),
              StrokeButton(
                onPressed: () => {},
                child: const Text('PRIMARY STROKE BUTTON'),
              ),
              SizedBox(height: 10.h),
              GhostButton(
                onPressed: () => {},
                child: const Text('PRIMARY GHOST BUTTON'),
              ),
              SizedBox(height: 10.h),
              FilledButton(
                style: context.theme.buttonsStyle.secondaryFilledButton,
                onPressed: () {},
                child: const Text('SECONDARY FILLED BUTTON'),
              ),
              SizedBox(height: 10.h),
              StrokeButton(
                style: context.theme.buttonsStyle.secondaryOutlineButton,
                onPressed: () {},
                child: const Text('SECONDARY STROKE BUTTON'),
              ),
              SizedBox(height: 10.h),
              GhostButton(
                style: context.theme.buttonsStyle.secondaryTextButton,
                onPressed: () {},
                child: const Text('SECONDARY GHOST BUTTON'),
              ),
            ],
          ),
        ),
      );
}
