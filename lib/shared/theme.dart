import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const pageTransition = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  );

  static final filledButtonStyle = FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );

  static final textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    ),
  );

  static final textTheme = GoogleFonts.exo2TextTheme();

  static FlexScheme schemeColor = FlexScheme.aquaBlue;

  static final overlayStyleDark = SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  static final overlayStyleLight = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  static final light = FlexThemeData.light(
    scheme: FlexScheme.ebonyClay,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useM2StyleDividerInM3: true,
      defaultRadius: 4.0,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      segmentedButtonSchemeColor: SchemeColor.primaryContainer,
      segmentedButtonRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    textTheme: textTheme,
  );

  static final dark = FlexThemeData.dark(
    scheme: FlexScheme.ebonyClay,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 25,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 19,
      useM2StyleDividerInM3: true,
      defaultRadius: 4.0,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      segmentedButtonSchemeColor: SchemeColor.primaryContainer,
      segmentedButtonRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    textTheme: textTheme,
  );
}

extension AppThemeHelper on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get texts => theme.textTheme;
}
