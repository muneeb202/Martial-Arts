import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeInterGray10001 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray10001,
      );
  static get headlineMediumGray700 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.gray700,
      );

  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
      color: appTheme.black900,
      fontFamily: 'Poppins',
      fontSize: 15.fSize,
      fontWeight: FontWeight.normal);

  static get headlineMediumModakBluegray200 =>
      theme.textTheme.headlineMedium!.modak.copyWith(
        color: appTheme.blueGray900,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeInterBlack900 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        fontFamily: 'Montserrat',
          color: appTheme.black900, fontSize: 22, fontWeight: FontWeight.w600);

  static get headlineMediumModakDeeporange300 =>
      theme.textTheme.headlineMedium!.modak.copyWith(
        color: appTheme.red100,
        fontSize: 29.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeCyan90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w400,
      );

  // Modak text style
  static get modakBluegray200 => TextStyle(
        color: appTheme.blueGray900,
        fontSize: 98.fSize,
        fontWeight: FontWeight.w400,
      ).modak;
  static get modakDeeporange300 => TextStyle(
        color: appTheme.orangeA200,
        fontSize: 98.fSize,
        fontWeight: FontWeight.w400,
      ).modak;
  static get modakOrange400 => TextStyle(
        color: appTheme.orange50,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w400,
      ).modak;

  static get bodyLargeInterPrimary => theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumGray50001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 13.fSize,
      );
  static get bodyMediumInterGray600 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray600,
      );
  static get titleLargeNunitoBluegray700 =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: appTheme.blueGray700,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );

  static get titleLargeInterGray5001 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.gray5001,
        fontWeight: FontWeight.w800,
      );

  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins.copyWith(
        fontSize: 13.fSize,
      );
  static get bodySmallInterIndigoA700 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.indigoA700,
        fontSize: 10.fSize,
      );
  static get bodySmallMontserratBluegray900a2 =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: appTheme.blueGray900A2,
        fontSize: 12.fSize,
      );
  static get bodySmallMontserratRedA700a2 =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: appTheme.redA700A2,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsff242422 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: Color(0XFF242422),
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsff6a6767 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: Color(0XFF6A6767),
        fontSize: 12.fSize,
      );
  static get bodySmallSpaceGroteskBlack900 =>
      theme.textTheme.bodySmall!.spaceGrotesk.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  // Headline style
  static get headlineMediumNotoSans => theme.textTheme.headlineMedium!.notoSans;
  static get headlineSmallManrope => theme.textTheme.headlineSmall!.manrope;
  static get headlineSmallMontserratBluegray900 =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: appTheme.blueGray900,
      );
  static get headlineSmallPoppinsGray700 =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: appTheme.gray700,
      );
  static get headlineSmallPoppinsffffffff =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: Color(0XFFFFFFFF),
      );
  // Label text style
  static get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get labelLargeGray700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray700.withOpacity(0.69),
        fontSize: 13.fSize,
      );
  static get labelLargeGray700_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray700.withOpacity(0.69),
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeInterBluegray500 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray500,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterExtraBold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeInterGray50001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray50001,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeInterMedium =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeInterPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterff64748b =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: Color(0XFF64748B),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterffff5b00 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: Color(0XFFFF5B00),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeNunito => theme.textTheme.labelLarge!.nunito.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeNunitoGray700 =>
      theme.textTheme.labelLarge!.nunito.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumInterWhiteA700 =>
      theme.textTheme.labelMedium!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumRoboto => theme.textTheme.labelMedium!.roboto.copyWith(
        fontSize: 10.fSize,
      );
  // Space text style
  static get spaceGroteskWhiteA700 => TextStyle(
        color: appTheme.whiteA700.withOpacity(0.44),
        fontSize: 128.fSize,
        fontWeight: FontWeight.w700,
      ).spaceGrotesk;
  static get spaceGroteskWhiteA700Bold => TextStyle(
        color: appTheme.whiteA700.withOpacity(0.55),
        fontSize: 128.fSize,
        fontWeight: FontWeight.w700,
      ).spaceGrotesk;
  // Title text style
  static get titleLargeIBMPlexSansDeeporange500 =>
      theme.textTheme.titleLarge!.iBMPlexSans.copyWith(
        color: appTheme.deepOrange500,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBluegray700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 21.fSize,
      );
  static get titleLargeInter => theme.textTheme.titleLarge!.inter;
  static get titleLargeInterGray50 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.gray50,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      );
  static get titleLargeNunitoBluegray900 =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: appTheme.blueGray900,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeNunitoBluegray900Bold =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: appTheme.blueGray900,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeNunitoWhiteA700 =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: appTheme.whiteA700,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeNunitoff2e2e2e =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: Color(0XFF2E2E2E),
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeNunitoff6a6767 =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: Color(0XFF6A6767),
        fontSize: 23.fSize,
      );
  static get titleLargeNunitoff2e2e2eRegular =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: Color(0XFF2E2E2E),
        fontSize: 23.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRalewayBluegray900 =>
      theme.textTheme.titleLarge!.raleway.copyWith(
        color: appTheme.blueGray900,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeffffffff => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFFFFFFFF),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray50,
      );
  static get titleMediumInter996a6868 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.deepOrange50001.withOpacity(0.7),
      );
  static get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterWhiteA700 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumInterff6a6767 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.deepOrange50001,
      );
  static get titleMediumManropeWhiteA700 =>
      theme.textTheme.titleMedium!.manrope.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumNunitoGray70001 =>
      theme.textTheme.titleMedium!.nunito.copyWith(
        color: appTheme.gray70001,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmall14 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
      );
  static get titleSmallBlack => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w900,
      );
  static get titleSmallGray700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
      );
  static get titleSmallGray90014 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
      );
  static get titleSmallInterBluegray500 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray500,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterBluegray500Medium =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray500,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterGray50 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray50,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallInterOrangeA200 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.orangeA200,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallNotoSansGray50001 =>
      theme.textTheme.titleSmall!.notoSans.copyWith(
        color: appTheme.gray50001,
      );
  static get titleSmallNotoSansGray700 =>
      theme.textTheme.titleSmall!.notoSans.copyWith(
        color: appTheme.gray700,
      );
  static get titleSmallNunitoWhiteA700 =>
      theme.textTheme.titleSmall!.nunito.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get iBMPlexSans {
    return copyWith(
      fontFamily: 'IBM Plex Sans',
    );
  }

  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get spaceGrotesk {
    return copyWith(
      fontFamily: 'Space Grotesk',
    );
  }

  TextStyle get modak {
    return copyWith(
      fontFamily: 'Modak',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get aBeeZee {
    return copyWith(
      fontFamily: 'ABeeZee',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }

  TextStyle get notoSans {
    return copyWith(
      fontFamily: 'Noto Sans',
    );
  }
}
