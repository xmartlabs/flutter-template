import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef CheckboxList<T> = ({bool value, String title, String? subtitle});

class AppCheckbox<T> extends StatefulWidget {
  final bool initialValue;
  final List<CheckboxList> items;
  final void Function(bool?) onPressed;
  final bool? shrinkWrap;
  final Axis? scrollDirection;

  const AppCheckbox({
    required this.onPressed,
    required this.items,
    required this.initialValue,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    super.key,
  });

  @override
  State<AppCheckbox<T>> createState() => _AppCheckboxState<T>();
}

class _AppCheckboxState<T> extends State<AppCheckbox<T>> {
  late List<bool> isCheckedList;
  late bool shrinkWrap;
  late Axis scrollDirection;

  @override
  void initState() {
    isCheckedList = widget.items
        .map(
          (item) => item.value,
        )
        .toList();
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
            child: CheckboxListTile(
              value: isCheckedList[index],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[index] = value!;
                });
                widget.onPressed(value);
              },
              title: Text(element.title),
              subtitle:
                  element.subtitle != null ? Text(element.subtitle!) : null,
            ),
          );
        },
      );
}
