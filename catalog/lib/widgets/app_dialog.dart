import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String? actionButtonText;
  final void Function()? onActionPressed;
  final String? cancelButtonText;

  const AppDialog({
    required this.title,
    this.content,
    this.cancelButtonText,
    this.actionButtonText,
    this.onActionPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        elevation: 0,
        backgroundColor: context.theme.colors.surface.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: context.theme.colors.surface.shade500),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: context.theme.textStyles.customOverline
                  .copyWith(color: context.theme.colors.textColor.shade300)
                  .semibold(),
            ),
            const Spacer(),
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.close,
                color: context.theme.colors.textColor.shade300,
              ),
            ),
          ],
        ),
        content: content != null
            ? Text(
                content!,
                style: context.theme.textStyles.bodyMedium
                    ?.copyWith(color: context.theme.colors.textColor.shade400),
              )
            : null,
        actionsAlignment: _getAligment(),
        buttonPadding: EdgeInsets.only(left: 10.w, right: 10.w),
        actions: [
          if (cancelButtonText != null)
            SizedBox(
              width: _getWidth(),
              child: TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  cancelButtonText!,
                  style: context.theme.textStyles.buttonMedium.copyWith(
                    color: context.theme.colors.textColor.shade300,
                  ),
                ),
              ),
            ),
          if (actionButtonText != null)
            SizedBox(
              width: _getWidth(),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) =>
                        AppColors.getColorScheme().primary.shade500,
                  ),
                ),
                child: Text(
                  actionButtonText!,
                  style: context.theme.textStyles.buttonMedium.copyWith(
                    color: context.theme.colors.textColor.shade100,
                  ),
                ),
                onPressed: () {
                  if (onActionPressed != null) {
                    onActionPressed!();
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
        ],
      );

  MainAxisAlignment _getAligment() {
    if (actionButtonText == null) {
      return MainAxisAlignment.start;
    } else if (cancelButtonText == null) {
      return MainAxisAlignment.end;
    } else {
      return MainAxisAlignment.spaceAround;
    }
  }

  double? _getWidth() {
    if (actionButtonText == null || cancelButtonText == null) {
      return 130.w;
    }
    return null;
  }
}
