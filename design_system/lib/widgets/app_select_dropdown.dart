import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MenuItems<T> = ({T value, String label});

const _kAnimationDuration = Duration(milliseconds: 200);

final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

class AppSelectDropdown<T> extends HookWidget {
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
  Widget build(BuildContext context) {
    final buttonFocusNode = useFocusNode(debugLabel: 'Menu Button-$label');
    final menuController = useMemoized(MenuController.new);
    final animationController =
        useAnimationController(duration: _kAnimationDuration);
    final iconTurns = useMemoized(
      () => animationController.drive(_halfTween.chain(_easeInTween)),
      [animationController],
    );
    final selectedValues = useState<List<MenuItems<T>>>([]);

    return MenuAnchor(
      childFocusNode: buttonFocusNode,
      menuChildren: items
          .map(
            (elem) => CheckboxMenuButton(
              closeOnActivate: false,
              value: selectedValues.value.contains(elem),
              onChanged: (value) {
                onChanged?.call(elem.value);
                selectedValues.value = value!
                    ? [...selectedValues.value, elem]
                    : selectedValues.value
                        .where((selected) => selected != elem)
                        .toList();
              },
              child: Container(
                width: _calculateWidth(width),
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
      controller: menuController,
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
              animationController.reverse();
            } else {
              controller.open();
              animationController.forward();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  width: width ?? 1.sw,
                  padding: EdgeInsets.all(8.sp),
                  child: Text(
                    selectedValues.value.isEmpty
                        ? label
                        : selectedValues.value.map((e) => e.label).join(', '),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: context.theme.textStyles.labelMedium,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: RotationTransition(
                    turns: iconTurns,
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
  }

  double _calculateWidth(double? width) {
    if (width == null) return 1.sw * .761;
    if (width <= .3.sw) return width * .9;
    if (width <= .5.sw) return width * .93;
    if (width <= .8.sw) return width * .95;
    if (width < 1.sw) return width * .8;
    return width * .761;
  }
}
