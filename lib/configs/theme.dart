import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d4e2c),
      surfaceTint: Color(0xff8d4e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbcb),
      onPrimaryContainer: Color(0xff703717),
      secondary: Color(0xff765849),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbcb),
      onSecondaryContainer: Color(0xff5c4033),
      tertiary: Color(0xff655f31),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffede4aa),
      onTertiaryContainer: Color(0xff4d481c),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a16),
      onSurfaceVariant: Color(0xff52443d),
      outline: Color(0xff85736c),
      outlineVariant: Color(0xffd7c2b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb692),
      primaryFixed: Color(0xffffdbcb),
      onPrimaryFixed: Color(0xff341000),
      primaryFixedDim: Color(0xffffb692),
      onPrimaryFixedVariant: Color(0xff703717),
      secondaryFixed: Color(0xffffdbcb),
      onSecondaryFixed: Color(0xff2c160b),
      secondaryFixedDim: Color(0xffe6beac),
      onSecondaryFixedVariant: Color(0xff5c4033),
      tertiaryFixed: Color(0xffede4aa),
      onTertiaryFixed: Color(0xff1f1c00),
      tertiaryFixedDim: Color(0xffd0c890),
      onTertiaryFixedVariant: Color(0xff4d481c),
      surfaceDim: Color(0xffe8d7d0),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xfffceae3),
      surfaceContainerHigh: Color(0xfff6e5de),
      surfaceContainerHighest: Color(0xfff0dfd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b2708),
      surfaceTint: Color(0xff8d4e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9f5c39),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a3023),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866657),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b370c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff746e3e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff170f0c),
      onSurfaceVariant: Color(0xff41332d),
      outline: Color(0xff5f4f48),
      outlineVariant: Color(0xff7b6962),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb692),
      primaryFixed: Color(0xff9f5c39),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff824424),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866657),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4e40),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff746e3e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5b5628),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3bc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xfff6e5de),
      surfaceContainerHigh: Color(0xffebd9d2),
      surfaceContainerHighest: Color(0xffdfcec7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e1d01),
      surfaceTint: Color(0xff8d4e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733919),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f261a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5f4335),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff312d04),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4f4a1e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362923),
      outlineVariant: Color(0xff55463f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb692),
      primaryFixed: Color(0xff733919),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff572305),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5f4335),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462d20),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4f4a1e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff383309),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5af),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede6),
      surfaceContainer: Color(0xfff0dfd8),
      surfaceContainerHigh: Color(0xffe2d1ca),
      surfaceContainerHighest: Color(0xffd4c3bc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb692),
      surfaceTint: Color(0xffffb692),
      onPrimary: Color(0xff542103),
      primaryContainer: Color(0xff703717),
      onPrimaryContainer: Color(0xffffdbcb),
      secondary: Color(0xffe6beac),
      onSecondary: Color(0xff432a1e),
      secondaryContainer: Color(0xff5c4033),
      onSecondaryContainer: Color(0xffffdbcb),
      tertiary: Color(0xffd0c890),
      onTertiary: Color(0xff353107),
      tertiaryContainer: Color(0xff4d481c),
      onTertiaryContainer: Color(0xffede4aa),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120e),
      onSurface: Color(0xfff0dfd8),
      onSurfaceVariant: Color(0xffd7c2b9),
      outline: Color(0xffa08d85),
      outlineVariant: Color(0xff52443d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff8d4e2c),
      primaryFixed: Color(0xffffdbcb),
      onPrimaryFixed: Color(0xff341000),
      primaryFixedDim: Color(0xffffb692),
      onPrimaryFixedVariant: Color(0xff703717),
      secondaryFixed: Color(0xffffdbcb),
      onSecondaryFixed: Color(0xff2c160b),
      secondaryFixedDim: Color(0xffe6beac),
      onSecondaryFixedVariant: Color(0xff5c4033),
      tertiaryFixed: Color(0xffede4aa),
      onTertiaryFixed: Color(0xff1f1c00),
      tertiaryFixedDim: Color(0xffd0c890),
      onTertiaryFixedVariant: Color(0xff4d481c),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff423732),
      surfaceContainerLowest: Color(0xff140c09),
      surfaceContainerLow: Color(0xff221a16),
      surfaceContainer: Color(0xff271e1a),
      surfaceContainerHigh: Color(0xff322824),
      surfaceContainerHighest: Color(0xff3d332e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3bf),
      surfaceTint: Color(0xffffb692),
      onPrimary: Color(0xff451800),
      primaryContainer: Color(0xffc97e59),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd4c1),
      onSecondary: Color(0xff372014),
      secondaryContainer: Color(0xffad8979),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe6dea4),
      onTertiary: Color(0xff2a2600),
      tertiaryContainer: Color(0xff99925f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8cf),
      outline: Color(0xffc2aea5),
      outlineVariant: Color(0xff9f8c84),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff723818),
      primaryFixed: Color(0xffffdbcb),
      onPrimaryFixed: Color(0xff240900),
      primaryFixedDim: Color(0xffffb692),
      onPrimaryFixedVariant: Color(0xff5b2708),
      secondaryFixed: Color(0xffffdbcb),
      onSecondaryFixed: Color(0xff1f0c03),
      secondaryFixedDim: Color(0xffe6beac),
      onSecondaryFixedVariant: Color(0xff4a3023),
      tertiaryFixed: Color(0xffede4aa),
      onTertiaryFixed: Color(0xff141100),
      tertiaryFixedDim: Color(0xffd0c890),
      onTertiaryFixedVariant: Color(0xff3b370c),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff4d423d),
      surfaceContainerLowest: Color(0xff0d0604),
      surfaceContainerLow: Color(0xff251c18),
      surfaceContainer: Color(0xff2f2621),
      surfaceContainerHigh: Color(0xff3b302c),
      surfaceContainerHighest: Color(0xff463b37),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece5),
      surfaceTint: Color(0xffffb692),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb08a),
      onPrimaryContainer: Color(0xff1a0500),
      secondary: Color(0xffffece5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2baa8),
      onSecondaryContainer: Color(0xff180701),
      tertiary: Color(0xfffaf2b6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffccc48c),
      onTertiaryContainer: Color(0xff0d0b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece5),
      outlineVariant: Color(0xffd3beb6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff723818),
      primaryFixed: Color(0xffffdbcb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb692),
      onPrimaryFixedVariant: Color(0xff240900),
      secondaryFixed: Color(0xffffdbcb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6beac),
      onSecondaryFixedVariant: Color(0xff1f0c03),
      tertiaryFixed: Color(0xffede4aa),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd0c890),
      onTertiaryFixedVariant: Color(0xff141100),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff594e49),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271e1a),
      surfaceContainer: Color(0xff382e2a),
      surfaceContainerHigh: Color(0xff443934),
      surfaceContainerHighest: Color(0xff50443f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
