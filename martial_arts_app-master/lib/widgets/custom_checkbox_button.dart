import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  bool? value;

  final Function(bool) onChange;

  final String? text;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextAlign? textAlignment;

  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => InkWell(
        onTap: () {
          value = !(value!);
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );
  Widget get leftSideCheckbox => Row(
        children: [
          Padding(
            child: checkboxWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget,
        ],
      );
  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText ? Expanded(child: textWidget) : textWidget,
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: checkboxWidget,
          ),
        ],
      );
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle,
      );
  Widget get checkboxWidget => SizedBox(
        height: iconSize,
        width: iconSize,
        child: Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                // Color when checkbox is disabled (unchecked)
                return theme.colorScheme.primary; // Example color
              }
              // Color when checkbox is enabled (unchecked)
              return Colors.white; // Example color
            }),
          checkColor: Colors.black,
          activeColor: theme.colorScheme.primary,
          //checkColor: theme.colorScheme.primary,
          side: BorderSide(color: theme.colorScheme.primary),
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          value: value ?? false,
          onChanged: (value) {
            onChange(value!);
          },
        ),
      );
}
