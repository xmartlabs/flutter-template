import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:design_system/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_system_gallery/gallery/gallery_scaffold_screen.dart';

@RoutePage()
class GalleryTextFieldsScreen extends StatefulWidget {
  const GalleryTextFieldsScreen({super.key});

  @override
  State<GalleryTextFieldsScreen> createState() =>
      _GalleryTextFieldsScreenState();
}

class _GalleryTextFieldsScreenState extends State<GalleryTextFieldsScreen> {
  int _characterCount = 0;
  final labelTextController = TextEditingController();
  final textAreaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => GalleryScaffold(
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
                  color: context.theme.customColors.textColor!.getShade(200),
                ),
                prefixIcon: Icon(
                  Icons.close,
                  color: context.theme.customColors.textColor!.getShade(200),
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
