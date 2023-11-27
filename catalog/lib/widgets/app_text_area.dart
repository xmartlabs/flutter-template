import 'package:catalog/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/widgets/app_text_fields.dart';

class AppTextArea extends StatefulWidget {
  final TextEditingController textController;
  final String? labelText;
  final String? hintText;
  final void Function(String text) onChange;
  final bool isOptional;
  final int maxLength;
  final int minLines;
  final int maxLines;

  const AppTextArea({
    required this.textController,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    required this.maxLength,
    required this.minLines,
    required this.maxLines,
    this.isOptional = false,
    super.key,
  });

  @override
  State<AppTextArea> createState() => _AppTextAreaState();
}

class _AppTextAreaState extends State<AppTextArea> {
  int _characterCount = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AppTextField(
            controller: widget.textController,
            labelText: widget.labelText,
            hintText: widget.hintText,
            onChange: (value) {
              setState(() {
                _characterCount = value.length;
              });
              widget.onChange(value);
            },
            keyboardType: TextInputType.multiline,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              const Spacer(),
              Text(
                '$_characterCount/${widget.maxLength}',
                style: context.theme.textStyles.bodySmall?.copyWith(
                  color: context.theme.colors.textColor.shade300,
                ),
              ),
            ],
          ),
        ],
      );
}
