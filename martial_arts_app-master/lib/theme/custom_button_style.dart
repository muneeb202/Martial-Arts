import 'package:martial_art/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
      );

  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 1,
      );

  // Gradient button style
  static BoxDecoration get gradientOrangeAToPrimaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(17.h),
        gradient: LinearGradient(
          begin: Alignment(0.0, 0),
          end: Alignment(1.2, 0),
          colors: [
            appTheme.orangeA200,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientOrangeAToPrimaryTL24Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0.0, 0),
          end: Alignment(1.2, 0),
          colors: [
            appTheme.orangeA200,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientWhiteAToWhiteADecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(22.h),
      border: Border.all(color: theme.colorScheme.primary)
      // boxShadow: [
      //   BoxShadow(
      //     color: appTheme.deepOrange20001,
      //     spreadRadius: 2.h,
      //     blurRadius: 2.h,
      //     offset: Offset(
      //       0,
      //       0,
      //     ),
      //   ),
      // ],

      // gradient: LinearGradient(
      //   begin: Alignment(0.5, 0),
      //   end: Alignment(0.5, 1),
      //   colors: [
      //     appTheme.whiteA700,
      //     appTheme.whiteA700.withOpacity(0),
      //   ],
      // ),
      );

  // Outline button style
  static ButtonStyle get outlineBlackTL15 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 1,
      );
  static ButtonStyle get outlinePrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(color: theme.colorScheme.primary),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.h),
        ),
        // shadowColor: theme.colorScheme.primary,
        // elevation: 0,
      );
  static ButtonStyle get outlinePrimaryTL19 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.h),
        ),
        shadowColor: theme.colorScheme.primary.withOpacity(0.5),
        elevation: 0,
      );
  static ButtonStyle get outlinePrimaryTL28 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
