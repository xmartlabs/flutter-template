//ignore_for_file: unused-files, unused-code
import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:catalog/widgets/app_dropdown.dart';
import 'package:catalog/widgets/app_text_area.dart';
import 'package:catalog/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Column(
          children: [
            // AppTextField(
            //   controller: labelTextController,
            //   labelText: 'Label',
            //   helperText: 'Helper text',
            //   hintText: 'Text',
            //   suffixIcon: Icon(
            //     Icons.close,
            //     color: context.theme.colors.textColor.shade200,
            //   ),
            //   prefixIcon: Icon(
            //     Icons.close,
            //     color: context.theme.colors.textColor.shade200,
            //   ),
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // SizedBox(height: 10.h),
            // AppTextArea(
            //   maxLength: 100,
            //   textController: labelTextController,
            //   labelText: 'Label',
            //   hintText: 'Text',
            //   onChange: (String text) {},
            //   minLines: 8,
            //   maxLines: 10,
            // ),
            // SizedBox(height: 10.h),
            AppDropdownMenu<int>(
              initialValue: 1,
              dropdownMenuEntries: const [
                AppDropdownMenuEntry(value: 1, label: 'Option 1'),
                AppDropdownMenuEntry(value: 2, label: 'Option 2'),
                AppDropdownMenuEntry(value: 3, label: 'Option 3'),
                AppDropdownMenuEntry(value: 4, label: 'Option 4'),
                AppDropdownMenuEntry(value: 5, label: 'Option 5'),
                AppDropdownMenuEntry(value: 6, label: 'Option 6'),
              ],
              onSelected: (int? value) => print(value),
            ),
          ],
        ),
      ),
    );
  }
}
