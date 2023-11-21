import 'package:auto_route/auto_route.dart';
import 'package:catalog/widgets/app_base_button.dart';
import 'package:catalog/widgets/app_primary_button.dart';
import 'package:catalog/widgets/app_secondary_button.dart';
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
              ..._buildPrimaryButton(),
              ..._buildSecondarySelectableButton(),
              ..._buildSecondaryNotSelectableButton(),
            ],
          ),
        ),
      );

  Iterable<Widget> _buildSecondaryNotSelectableButton() =>
      StyleButton.values.map(
        (element) => Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: AppSecondaryButton(
                  text: "SECONDARY NOT SELECTABLE "
                      "${element.name.toUpperCase()}",
                  onPressed: () => {},
                  style: element,
                  isSelected: false,
                ),
              ),
            ],
          ),
        ),
      );

  Iterable<Widget> _buildSecondarySelectableButton() => StyleButton.values.map(
        (element) => Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: AppSecondaryButton(
                  text:
                      "SECONDARY SELECTABLE BUTTON "
                          "${element.name.toUpperCase()}",
                  onPressed: () => {},
                  style: element,
                  isSelected: true,
                ),
              ),
            ],
          ),
        ),
      );

  Iterable<Widget> _buildPrimaryButton() => StyleButton.values.map(
        (element) => Container(
          margin: EdgeInsets.only(bottom: 20.w),
          child: Row(
            children: [
              Expanded(
                child: AppPrimaryButton(
                  text: "PRIMARY BUTTON ${element.name.toUpperCase()}",
                  onPressed: () => {},
                  style: element,
                ),
              ),
            ],
          ),
        ),
      );
}
