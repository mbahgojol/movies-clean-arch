import 'package:flutter/material.dart';
import 'package:shared/common/color_schemes.dart';
import 'package:shared/common/typography.dart';

final ThemeData kLightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: kLightColorSchemes,
  textTheme: kTextTheme.apply(
    fontFamily: 'OpenSans',
    bodyColor: kLightColorSchemes.onBackground,
    displayColor: kLightColorSchemes.onBackground,
  ),
  dividerTheme: const DividerThemeData(
    thickness: 0.75,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      textStyle: kTextTheme.labelLarge,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    prefixStyle: kTextTheme.bodyLarge?.copyWith(
      color: kLightColorSchemes.onBackground,
    ),
    labelStyle: kTextTheme.labelSmall?.copyWith(
      color: kLightColorSchemes.onBackground,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      textStyle: kTextTheme.labelSmall,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: kLightColorSchemes.background,
      foregroundColor: kLightColorSchemes.onBackground,
    ),
  ),
);
