import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AppDropdownMultipleChoice<T> extends StatefulWidget {
  final String? buttonText;
  final List<MultiSelectItem<T>> dropdownMenuEntries;
  final void Function(List<T>) onSelect;
  final void Function(List<T>?)? onSaved;
  final void Function(List<T>)? onSelectionChanged;

  const AppDropdownMultipleChoice({
    required this.dropdownMenuEntries,
    required this.onSelect,
    this.onSaved,
    this.onSelectionChanged,
    this.buttonText,
    super.key,
  });

  @override
  State<AppDropdownMultipleChoice<T>> createState() =>
      _AppDropdownMultipleChoiceState();
}

class _AppDropdownMultipleChoiceState<T>
    extends State<AppDropdownMultipleChoice<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiSelectDialogField<T>(
        items: widget.dropdownMenuEntries,
        dialogHeight: 150.h,
        backgroundColor: context.theme.colors.textColor.shade100,
        cancelText: Text(
          'Cancel',
          style: context.theme.textStyles.bodySmall!
              .copyWith(color: context.theme.colors.textColor.shade200),
        ),
        checkColor: context.theme.colors.primary.shade600,
        confirmText: Text(
          'Confirm',
          style: context.theme.textStyles.bodySmall!
              .copyWith(color: context.theme.colors.textColor.shade200),
        ),
        selectedColor: context.theme.colors.textColor.shade100,
        decoration: BoxDecoration(
          color: context.theme.colors.textColor.shade100,
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          border: Border.all(
            color: context.theme.colors.onSurface.shade200,
          ),
        ),
        buttonIcon: Icon(
          Icons.arrow_drop_down_rounded,
          color: context.theme.colors.textColor.shade200,
        ),
        buttonText: widget.buttonText != null
            ? Text(
                widget.buttonText!,
                style: context.theme.textStyles.bodyMedium!
                    .copyWith(color: context.theme.colors.primary.shade500),
              )
            : null,
        onConfirm: (results) => widget.onSelect(results),
        onSaved: (results) => widget.onSelect(results!),
        onSelectionChanged: (results) => widget.onSelect(results),
      );
}
