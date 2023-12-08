import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String? actionButtonText;
  final VoidCallback? onActionPressed;
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
        title: Row(
          children: [
            Text(title),
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
        content: content != null ? Text(content!) : null,
        actionsAlignment: _getAligment(),
        actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (cancelButtonText != null)
                  Expanded(
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
                  Expanded(
                    child: FilledButton(
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

  double? _getActionButtonsWidth() {
    if (actionButtonText == null || cancelButtonText == null) {
      return 130.w;
    }
    return null;
  }
}
