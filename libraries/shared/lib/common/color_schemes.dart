import 'package:flutter/material.dart';

// these color names came from https://www.color-name.com
const _kDarkCharcoal = Color(0xFF333333);
const _kLightSlateGray = Color(0xFF768695);
const _kSpaceCadet = Color(0xFF16205B);
const _kVividRed = Color(0xFFF91316);
const movieGreyDark = Color(0xff1d2733);
const movieGreyLight = Color(0xff232e3c);
const movieOrangeLight = Color(0xffd84216);

const ColorScheme kLightColorSchemes = ColorScheme.light(
  primary: _kVividRed,
  secondary: _kSpaceCadet,
  background: Colors.white,
  onBackground: _kLightSlateGray,
  onSurface: _kDarkCharcoal,
  outlineVariant: _kLightSlateGray,
);

const ColorScheme kMoviesLightColorSchemes = ColorScheme.light(
    primary: movieGreyDark,
    secondary: movieGreyLight,
    background: Colors.white,
    onBackground: movieGreyDark,
    onSurface: movieGreyDark,
    outlineVariant: movieGreyDark,
    onSecondary: movieOrangeLight);
