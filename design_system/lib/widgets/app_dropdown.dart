import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

typedef AppDropdownItems<T> = ({T value, String label});

class AppDropdownMenu<T> extends StatefulWidget {
  final List<AppDropdownItems<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final T? initialValue;

  const AppDropdownMenu({
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.initialValue,
    super.key,
  });

  @override
  State<AppDropdownMenu<T>> createState() => _AppDropdownMenuState();
}

class _AppDropdownMenuState<T> extends State<AppDropdownMenu<T>> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => DropdownMenu<T>(
        initialSelection: widget.initialValue,
        trailingIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: context.theme.customColors.textColor!.getShade(200),
        ),
        controller: _controller,
        onSelected: (T? value) => widget.onSelected(value),
        dropdownMenuEntries: widget.dropdownMenuEntries
            .map<DropdownMenuEntry<T>>(
              (AppDropdownItems<T> item) => DropdownMenuEntry<T>(
                value: item.value,
                label: item.label,
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith(
                    (Set<WidgetState> states) =>
                        context.theme.colorScheme.surface.getShade(100),
                  ),
                  foregroundColor: WidgetStateColor.resolveWith(
                    (Set<WidgetState> states) =>
                        context.theme.customColors.textColor!.getShade(400),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
