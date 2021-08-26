import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultMargin = 30;

final Color primaryColor = Color(0xFFFFFFFF);
final Color secondaryColor = Color(0xFF4EDE1B);

final Color backgroundColor1 = Color(0xFF1F1D2B);
final Color backgroundColor2 = Color(0xFF242231);
final Color backgroundColor3 = Color(0xFF252836);
final Color backgroundColor4 = Color(0xFFECECEC);

Color alertColor = Color(0xFFED6363);

TextStyle myTextStyle = GoogleFonts.merriweather();

final ThemeData myThemeData = ThemeData(
  textTheme: myTextTheme,
  primaryColor: primaryColor,
  accentColor: backgroundColor2,
  scaffoldBackgroundColor: backgroundColor2,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    textTheme: myTextTheme.apply(bodyColor: primaryColor),
    elevation: 0,
    color: backgroundColor1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          textStyle: TextStyle(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))))),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundColor3,
    selectedItemColor: secondaryColor,
    unselectedItemColor: Colors.grey,
  ),
);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3:
      GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.merriweather(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: primaryColor),
  headline5: GoogleFonts.merriweather(
      fontSize: 23, fontWeight: FontWeight.w400, color: primaryColor),
  headline6: GoogleFonts.merriweather(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: primaryColor),
  subtitle1: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.libreFranklin(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.grey),
  button: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
