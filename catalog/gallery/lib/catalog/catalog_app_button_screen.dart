import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
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
                child: const Text('PRIMARY BUTTON FILLED'),
              ),
              SizedBox(height: 10.h),
              OutlinedButton(
                onPressed: () => {},
                child: const Text('PRIMARY BUTTON STROKE'),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () => {},
                child: const Text('PRIMARY BUTTON GHOST'),
              ),
              SizedBox(height: 10.h),
              FilledButton(
                style: context.theme.buttons.secondaryFilledButton,
                onPressed: () => {},
                child: const Text('SECONDARY BUTTON FILLED'),
              ),
              SizedBox(height: 10.h),
              FilledButton(
                style: context.theme.buttons.secondaryOutlineButton,
                onPressed: () => {},
                child: const Text('SECONDARY BUTTON STROKE'),
              ),
              SizedBox(height: 10.h),
              FilledButton(
                style: context.theme.buttons.secondaryTextButton,
                onPressed: () => {},
                child: const Text('SECONDARY BUTTON GHOST'),
              ),
            ],
          ),
        ),
      );
}
