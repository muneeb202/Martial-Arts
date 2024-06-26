import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

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
          style: GoogleFonts.montserrat(
              color: appTheme.deepOrange500,
            fontWeight: FontWeight.w700,
            fontSize: 19.fSize,
          ),
        ),
      ),
    );
  }
}
