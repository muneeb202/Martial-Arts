import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/base_button.dart';

class CustomOutlinedButton extends BaseButton {
  CustomOutlinedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    Alignment? alignment,
    double? height,
    double? width,
    EdgeInsets? margin,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          alignment: alignment,
          width: width,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget,
          )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: this.height ?? 56.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Positioned(
          //       left: 20,
          //       child: leftIcon ?? const SizedBox.shrink(),
          //     ),
          //     Text(
          //       text,
          //       textAlign: TextAlign.center,
          //       style: buttonTextStyle,
          //     ),
          //     Positioned(
          //       right: 20,
          //       child: rightIcon ?? const SizedBox.shrink(),
          //     ),
          //   ],
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 18.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leftIcon ?? const SizedBox.shrink(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle,
                ),
              ),
              //SizedBox(width: 80.h,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: rightIcon ?? const SizedBox.shrink()),
                ),
              ),
            ],
          ),
        ),
      );
}
