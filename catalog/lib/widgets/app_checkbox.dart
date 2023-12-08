import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';

typedef AppCheckboxItems<T> = ({bool value, String label});

class AppCheckbox<T> extends StatefulWidget {
  final bool initialValue;
  final List<AppCheckboxItems> items;
  final void Function(T?) onPressed;

  const AppCheckbox({
    required this.onPressed,
    required this.items,
    required this.initialValue,
    super.key,
  });

  @override
  State<AppCheckbox<T>> createState() => _AppCheckboxState<T>();
}

class _AppCheckboxState<T> extends State<AppCheckbox<T>> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    isCheckedList = List.generate(
      widget.items.length,
      (index) => widget.items[index].value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final element = widget.items[index];
          return Row(
            children: [
              Checkbox(
                activeColor: context.theme.colors.primary,
                semanticLabel: element.label,
                checkColor: Colors.white,
                value: isCheckedList[index],
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedList[index] = value ?? false;
                    widget.onPressed(value as T?);
                  });
                },
              ),
              Text(
                element.label,
                style: context.theme.textStyles.bodyMedium
                    ?.copyWith(color: context.theme.colors.textColor.shade400),
              ),
            ],
          );
        },
      );
}
