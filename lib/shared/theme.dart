import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final textTheme = GoogleFonts.comicNeueTextTheme();

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
}

extension AppThemeHelper on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get texts => theme.textTheme;

  TextStyle get mainFontFamily => GoogleFonts.comicNeue();
  TextStyle get alterFontFamily => GoogleFonts.bangers();
}
