import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:catalog/theme/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogAppButtonScreen extends StatelessWidget {
  const CatalogAppButtonScreen({super.key});

  @override
  Widget build(BuildContext context) => CatalogScaffold(
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
                style: context.buttonsStyle.secondaryFilledButton,
                onPressed: (){},
                child: const Text('SECONDARY FILLED BUTTON'),
              ),
              SizedBox(height: 10.h),
              StrokeButton(
                style: context.buttonsStyle.secondaryOutlineButton,
                onPressed: (){},
                child: const Text('SECONDARY STROKE BUTTON'),
              ),
              SizedBox(height: 10.h),
              GhostButton(
                style: context.buttonsStyle.secondaryTextButton,
                onPressed: (){},
                child: const Text('SECONDARY GHOST BUTTON'),
              ),
            ],
          ),
        ),
      );
}
