import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownMenuEntry<T> {
  final T value;
  final String label;

  const AppDropdownMenuEntry({
    required this.value,
    required this.label,
  });
}

class AppDropdownMenu<T> extends StatefulWidget {
  final List<AppDropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final T? initialValue;
  final int maxElements;

  const AppDropdownMenu({
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.initialValue,
    this.maxElements = 6,
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
        textStyle: context.theme.textStyles.bodyMedium?.copyWith(
          color: context.theme.colors.primary.shade500,
        ),
        trailingIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: context.theme.colors.textColor.shade200,
        ),
        menuStyle: MenuStyle(
          maximumSize: MaterialStateProperty.resolveWith<Size?>(
            (Set<MaterialState> states) => Size(200, 35.h * widget.maxElements),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: context.theme.colors.textColor.shade100,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.colors.onSurface.shade200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
        ),
        controller: _controller,
        onSelected: (T? value) => widget.onSelected(value),
        dropdownMenuEntries: widget.dropdownMenuEntries
            .map<DropdownMenuEntry<T>>(
              (AppDropdownMenuEntry<T> color) => DropdownMenuEntry<T>(
                value: color.value,
                label: color.label,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) =>
                        AppColors.getColorScheme().surface.shade100,
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) =>
                        AppColors.getColorScheme().textColor.shade400,
                  ),
                ),
              ),
            )
            .toList(),
      );
}
