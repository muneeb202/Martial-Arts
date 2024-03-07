import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
    this.color,
  }) : super(key: key);

  String text;

  EdgeInsetsGeometry? margin;

  Color? color;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: TextStyle(
            color: color ?? appTheme.deepOrange500,
            fontSize: 20.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
