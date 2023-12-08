import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';

typedef AppRadioButtonItems<T> = ({T value, String label});

class AppRadioButton<T> extends StatefulWidget {
  final T initialValue;
  final List<AppRadioButtonItems> items;
  final void Function(T?) onPressed;

  const AppRadioButton({
    required this.onPressed,
    required this.items,
    required this.initialValue,
    super.key,
  });

  @override
  State<AppRadioButton<T>> createState() => _AppRadioButtonState<T>();
}

class _AppRadioButtonState<T> extends State<AppRadioButton<T>> {
  late T? selectedValue;

  @override
  void initState() {
    selectedValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final element = widget.items[index];
          return ListTile(
            title: Text(element.label),
            leading: Radio<T>(
              activeColor: context.theme.colors.primary.shade600,
              value: element.value,
              groupValue: selectedValue,
              onChanged: (T? value) {
                setState(
                  () {
                    selectedValue = value;
                    widget.onPressed(value);
                  },
                );
              },
            ),
          );
        },
      );
}
