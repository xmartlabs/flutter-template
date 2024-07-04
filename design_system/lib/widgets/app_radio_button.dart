import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef RadioButtonList<T> = ({T value, String label});

class AppRadioButton<T> extends StatefulWidget {
  final T initialValue;
  final List<RadioButtonList> items;
  final void Function(T?) onPressed;
  final bool? shrinkWrap;
  final Axis? scrollDirection;

  const AppRadioButton({
    required this.onPressed,
    required this.items,
    required this.initialValue,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    super.key,
  });

  @override
  State<AppRadioButton<T>> createState() => _AppRadioButtonState<T>();
}

class _AppRadioButtonState<T> extends State<AppRadioButton<T>> {
  late T? selectedValue;
  late bool shrinkWrap;
  late Axis scrollDirection;

  @override
  void initState() {
    selectedValue = widget.initialValue;
    shrinkWrap = widget.shrinkWrap!;
    scrollDirection = widget.scrollDirection!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        scrollDirection: widget.scrollDirection!,
        shrinkWrap: shrinkWrap,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final element = widget.items[index];
          return SizedBox(
            width: 1.sw,
            child: RadioListTile<T>(
              activeColor: context.theme.colorScheme.primary.getShade(600),
              title: Text(element.label),
              value: element.value,
              groupValue: selectedValue,
              onChanged: (T? value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onPressed(value);
              },
            ),
          );
        },
      );
}
