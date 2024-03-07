import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 1.h,
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
}
