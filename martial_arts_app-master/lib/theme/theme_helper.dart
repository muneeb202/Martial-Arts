import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'package:google_fonts/google_fonts.dart';
/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA70001,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.onPrimaryContainer,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
          shadowColor: appTheme.black900.withOpacity(0.25),
          elevation: 1,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(



        bodyLarge: GoogleFonts.poppins(
          color: appTheme.gray70099,
          fontSize: 16.fSize,
          // fontFamily: 'ABeeZee',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: appTheme.gray700,
          fontSize: 15.fSize,
          // fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.poppins(
          color: appTheme.gray700,
          fontSize: 11.fSize,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: GoogleFonts.poppins(
          color: appTheme.blueGray900,
          fontSize: 36.fSize,
          // fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.poppins(
          color: appTheme.whiteA700,
          fontSize: 28.fSize,
          // fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: GoogleFonts.poppins(
          color: appTheme.whiteA700,
          fontSize: 24.fSize,
          // fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: GoogleFonts.poppins(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          // fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        ),
        labelMedium: GoogleFonts.poppins(
          color: colorScheme.primary,
          fontSize: 11.fSize,
          // fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: GoogleFonts.poppins(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          // fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.poppins(
          color: Color(0XFFFFFFFF),
          fontSize: 16.fSize,
          // fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: GoogleFonts.poppins(
          color: colorScheme.primary,
          fontSize: 15.fSize,
          // fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFF5B00),
    secondaryContainer: Color(0XFFF97316),

    // On colors(text colors)
    onPrimary: Color(0XFF242422),
    onPrimaryContainer: Color(0XFFCBD5E1),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFBC0E);

  // Black
  Color get black900 => Color(0XFF000000);
// 6A6868
  // BlueGrayc
  Color get blueGray1004c => Color(0X4CD9D9D9);

  // BlueGray
  Color get blueGray50 => Color(0XFFF1F0F2);
  Color get blueGray500 => Color(0XFF64748B);
  Color get blueGray5001 => Color(0XFFEAECF0);
  Color get blueGray700 => Color(0XFF525252);
  Color get blueGray900 => Color(0XFF2E2E2E);
  Color get blueGray900A2 => Color(0XA2323940);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFCEB2);
  Color get deepOrange10001 => Color(0XFFFFD7C1);
  Color get deepOrange10002 => Color(0XFFFFD7C0);
  Color get deepOrange200 => Color(0XFFF2B999);
  Color get deepOrange20001 => Color(0XFFFFB790);
  Color get deepOrange50 => Color(0XFFFFDDDD);
  Color get deepOrange500 => Color(0XFFFF97316);
  Color get deepOrange50001 => Color(0XFFFEA580C);

  // DeepPurple
  Color get deepPurple500 => Color(0XFF8B5CF6);
  Color get deepPurple600 => Color(0XFF6D28D9);
  Color get deepPurpleA200 => Color(0XFF8B5CF6);

  // Gray
  Color get gray100 => Color(0XFFF7F6F6);
  Color get gray10001 => Color(0XFFF5F5F5);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray500 => Color(0XFF9B9BA1);
  Color get gray50001 => Color(0XFF959595);
  Color get gray5001 => Color(0XFFF8FAFC);
  Color get gray600 => Color(0XFF726D6D);
  Color get gray700 => Color(0XFF6A6767);
  Color get gray70001 => Color(0XFF666666);
  Color get gray70099 => Color(0X996A6868);
  Color get gray800 => Color(0XFF573353);
  Color get gray900 => Color(0XFF252525);

  // Grayc
  Color get gray5004c => Color(0X4C959DA5);

  // Indigo
  Color get indigo50 => Color(0XFFE2E8F0);
  Color get indigo5001 => Color(0XFFEBECFF);
  Color get indigoA700 => Color(0XFF3843FF);

  // Indigof
  Color get indigo9000f => Color(0X0F222C5C);

  // Orange
  Color get orange50 => Color(0XFFFFE9DD);
  Color get orange900 => Color(0XFFEA580C);
  Color get orangeA200 => Color(0XFFFFA34F);

  // Red
  Color get red100 => Color(0XFFFFDBDB);
  Color get red400 => Color(0XFFF65B4E);
  Color get red700 => Color(0XFFB04646);
  Color get redA200 => Color(0XFFFF4F4F);
  Color get redA700 => Color(0XFFDA0000);

  // RedA
  Color get redA700A2 => Color(0XA2E61010);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get whiteA70001 => Color(0XFFFCFCFF);

  // Yellow
  Color get yellow900 => Color(0XFFE98426);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
