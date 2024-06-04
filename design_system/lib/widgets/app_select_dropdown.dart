import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MenuItems<T> = ({T value, String label});

const _kAnimationDuration = Duration(milliseconds: 200);

class AppSelectDropdown<T> extends StatefulWidget {
  final double? width;
  final String label;
  final List<MenuItems<T>> items;
  final Function(T value)? onChanged;

  const AppSelectDropdown({
    required this.items,
    required this.label,
    this.onChanged,
    this.width,
    super.key,
  });

  @override
  State<AppSelectDropdown<T>> createState() => _AppSelectDropdownState<T>();
}

class _AppSelectDropdownState<T> extends State<AppSelectDropdown<T>>
    with SingleTickerProviderStateMixin {
  late final FocusNode _buttonFocusNode;
  final MenuController _menuController = MenuController();
  final List<MenuItems<T>> _selectedValues = [];
  late AnimationController _animationController;
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  // ignore: unused_field
  late Animation<double> _iconTurns;
  @override
  void initState() {
    _buttonFocusNode = FocusNode(debugLabel: 'Menu Button-${widget.label}');
    super.initState();
    _animationController = AnimationController(
      duration: _kAnimationDuration,
      vsync: this,
    );

    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MenuAnchor(
        childFocusNode: _buttonFocusNode,
        menuChildren: widget.items
            .map(
              (elem) => CheckboxMenuButton(
                closeOnActivate: false,
                value: _selectedValues.contains(elem),
                onChanged: (value) {
                  widget.onChanged?.call(elem.value);
                  setState(() {
                    if (value!) {
                      _selectedValues.add(elem);
                    } else {
                      _selectedValues.remove(elem);
                    }
                  });
                },
                child: Container(
                  width: _calculateWidth(),
                  constraints: BoxConstraints(
                    minWidth: 90.w,
                  ),
                  child: Text(
                    elem.label,
                    style: context.theme.textStyles.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            )
            .toList(),
        controller: _menuController,
        builder: (
          BuildContext context,
          MenuController controller,
          Widget? child,
        ) =>
            Container(
          constraints: BoxConstraints(
            minWidth: 90.w,
            maxWidth: 1.sw,
          ),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface.getShade(100),
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: context.theme.colorScheme.onSurface.getShade(200),
            ),
          ),
          child: InkWell(
            onTap: () {
              if (controller.isOpen) {
                controller.close();
                _animationController.reverse();
              } else {
                controller.open();
                _animationController.forward();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    width: widget.width ?? 1.sw,
                    padding: EdgeInsets.all(8.sp),
                    child: Text(
                      _selectedValues.isEmpty
                          ? widget.label
                          : _selectedValues.map((e) => e.label).join(', '),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: context.theme.textStyles.labelMedium,
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        Icons.expand_more,
                        color: context.theme.customColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  double _calculateWidth() {
    final width = widget.width;
    if (width == null) return 1.sw * .761;
    if (width <= .3.sw) return width * .9;
    if (width <= .5.sw) return width * .93;
    if (width <= .8.sw) return width * .95;
    if (width < 1.sw) return width * .8;
    return width * .761;
  }
}
