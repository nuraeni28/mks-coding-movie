import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kRichBlack = Color(0xFF000814);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color kMikadoYellow = Color(0xFFffc300);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF737373);
const Color KBlack = Color(0xFF1A1A1A);

// text style
final TextStyle kHeading5 =
    GoogleFonts.acme(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kTitle =
    GoogleFonts.acme(fontSize: 30, fontWeight: FontWeight.w400);
final TextStyle kHeading6 = GoogleFonts.acme(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.acme(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.acme(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kMikadoYellow,
  primaryContainer: kMikadoYellow,
  secondary: kPrussianBlue,
  secondaryContainer: kPrussianBlue,
  surface: kRichBlack,
  background: kRichBlack,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
