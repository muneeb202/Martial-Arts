import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple500,
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA200,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange900,
      );
  static BoxDecoration get fillSecondaryContainer1 => BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.51),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.6),
      );
  static BoxDecoration get fillPrimary2 => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientPrimaryToDeepOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            appTheme.deepOrange100,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToDeeporange200 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.4, -0.15),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            appTheme.deepOrange200,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray5001,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineDeepOrange => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrange10001,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray50001.withOpacity(0.2),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray5004c => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5004c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray5004c1 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5004c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGrayC => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5004c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineOrangeA => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.3),
        border: Border.all(
          color: appTheme.orangeA200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.2),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.indigo5001,
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  static BorderRadius get roundedBorder32 => BorderRadius.circular(
        32.h,
      );

  static BorderRadius get circleBorder2 => BorderRadius.circular(
        2.h,
      );
  static BorderRadius get circleBorder35 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get circleBorder7 => BorderRadius.circular(
        7.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL34 => BorderRadius.vertical(
        top: Radius.circular(34.h),
      );
  static BorderRadius get customBorderTL40 => BorderRadius.vertical(
        top: Radius.circular(40.h),
      );

// Custom borders

  static BorderRadius get customBorderBL34 => BorderRadius.vertical(
        bottom: Radius.circular(34.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
