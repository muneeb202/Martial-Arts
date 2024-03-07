import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  Color? backgroundColor;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: height ?? 50.v,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      flexibleSpace: _getStyle(),
      //leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 40.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgOutline_1:
        return Container(
          height: 60.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: appTheme.gray700.withOpacity(0.2),
                width: 1.h,
              ),
            ),
          ),
        );
      case Style.bgOutline:
        return Container(
          height: 60.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            //color: appTheme.whiteA70001,
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: appTheme.gray700.withOpacity(0.2),
                width: 1.h,
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgOutline_1,
  bgOutline,
  bgFill,
}
