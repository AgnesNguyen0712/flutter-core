import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

ThemeData buildPrimaryThemeData(BuildContext context) {
  return Theme.of(context).copyWith(
      primaryColor: Constants.cPrimaryColor,
      // Screen background color
      scaffoldBackgroundColor: Constants.cScaffoldBackgroundColor,
      // Disable splash color when click widgets(button, iconbutton)
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      // ->
      appBarTheme: AppBarTheme(
        backgroundColor: Constants.cAppbarBackgroundColor,
        // Change text color of status bar
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Constants.cAppBarIconColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          fontSize: Constants.cFontSize_14
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: Constants.cFontSize_14
        )
      ),
      colorScheme: ColorScheme.light().copyWith(
        primary: Colors.black,
        primaryVariant: Color(0xFF9d9d9d),
        secondary: Colors.white,
        secondaryVariant: Constants.cButtonBackgroundColor
      ),
      primaryTextTheme: GoogleFonts.interTextTheme(TextTheme(
        subtitle1: TextStyle(
            fontSize: Constants.cFontSize_16,
            fontWeight: FontWeight.w700,
            color: Constants.cSecondTextColor),
        subtitle2: TextStyle(
            fontSize: Constants.cFontSize_16,
            fontWeight: FontWeight.w500,
            color: Constants.cPrimaryTextColor),
        caption: TextStyle(
            fontSize: Constants.cFontSize_13,
            fontWeight: FontWeight.w500,
            color: Constants.cPrimaryTextColor),
        headline4: TextStyle(
            fontSize: Constants.cFontSize_16,
            fontWeight: FontWeight.bold,
            color: Constants.cPrimaryTextColor),
        headline3: TextStyle(
            fontSize: Constants.cFontSize_18,
            fontWeight:  FontWeight.bold,
            color: Constants.cPrimaryTextColor),
        headline2: TextStyle(
            fontSize: Constants.cFontSize_20,
            fontWeight: FontWeight.bold,
            color: Constants.cPrimaryTextColor),
        headline1: TextStyle(
            fontSize: Constants.cFontSize_26,
            fontWeight: FontWeight.bold,
            color: Constants.cPrimaryTextColor),
        overline: TextStyle(
            fontSize: Constants.cFontSize_16,
            fontWeight: FontWeight.w100,
            color: Constants.cPrimaryTextColor),
        button: TextStyle(
            fontSize: Constants.cFontSize_15,
            fontWeight: FontWeight.bold,
            color: Constants.cPrimaryTextColor),

      )));
}
