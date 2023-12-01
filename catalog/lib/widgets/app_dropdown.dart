import 'package:catalog/catalog.dart';
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
          color: context.theme.colors.textColor.shade200,
        ),
        controller: _controller,
        onSelected: (T? value) => widget.onSelected(value),
        dropdownMenuEntries: widget.dropdownMenuEntries
            .map<DropdownMenuEntry<T>>(
              (AppDropdownItems<T> item) => DropdownMenuEntry<T>(
                value: item.value,
                label: item.label,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) =>
                        context.theme.colors.surface.shade100,
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) =>
                        context.theme.colors.textColor.shade400,
                  ),
                ),
              ),
            )
            .toList(),
      );
}
