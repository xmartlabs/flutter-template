import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:catalog/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/catalog/catalog_scaffold_screen.dart';

@RoutePage()
class CatalogTextFieldsScreen extends StatefulWidget {
  const CatalogTextFieldsScreen({super.key});

  @override
  State<CatalogTextFieldsScreen> createState() =>
      _CatalogTextFieldsScreenState();
}

class _CatalogTextFieldsScreenState extends State<CatalogTextFieldsScreen> {
  int _characterCount = 0;
  final labelTextController = TextEditingController();
  final textAreaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => CatalogScaffold(
      title: 'TEXT FIELDS',
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(
              controller: labelTextController,
              labelText: 'Label',
              helperText: 'Helper text',
              hintText: 'Text',
              suffixIcon: Icon(
                Icons.close,
                color: context.theme.colors.textColor.shade200,
              ),
              prefixIcon: Icon(
                Icons.close,
                color: context.theme.colors.textColor.shade200,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.h),
            AppTextField(
              keyboardType: TextInputType.multiline,
              controller: textAreaTextController,
              maxLength: 100,
              labelText: 'Label',
              hintText: 'Text',
              currentLength: _characterCount,
              onChange: (value) {
                setState(() {
                  _characterCount = value.length;
                });
              },
              minLines: 8,
              maxLines: 10,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
}
