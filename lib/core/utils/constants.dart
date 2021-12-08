import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Define common values
abstract class Constants {
  // Color
  static const cPrimaryColor = Colors.black;
  static const cPrimaryTextColor = Colors.black;
  static const cSecondTextColor = Color(0xFF9d9d9d);
  static const cScaffoldBackgroundColor = Colors.white;
  static const cButtonBackgroundColor = Color(0XFFfefb63);
  static const cAppBarIconColor = Colors.black;
  static const cAppbarBackgroundColor = Color(0xE0E0E0);
  
  static const cTextFieldBorderColor = Color(0XFFD6D6D6);
  static const cSignColor = Colors.red;
  static const cSecondButtonBackgroundColor = Color(0XFFFDD835);
  static const cBorderColor = Color(0xffBDBDBD);
  static const cButtonTextColor = Colors.white;


  // Font size
  static final cFontSize_13 = 13.0;
  static final cFontSize_14 = 14.0;
  static final cFontSize_15 = 15.0;
  static final cFontSize_16 = 16.0;
  static final cFontSize_17 = 17.0;
  static final cFontSize_18 = 18.0;
  static final cFontSize_19 = 19.0;
  static final cFontSize_20 = 20.0;
  static final cFontSize_22 = 22.0;
  static final cFontSize_26 = 26.0;

  // Wordspacing size
  static final cWordSpacing_3 = 3.0;

  // Pading size
  static final cPadding_8 = 8.0;
  static final cPadding_10 = 10.0;
  static final cPadding_13 = 13.0;
  static final cPadding_15 = 15.0;
  static final cPadding_16 = 16.0;
  static final cPadding_20 = 20.0;
  static final cPadding_30 = 30.0;
  static final cPadding_40 = 40.0;


  // Marigin size
  static final cMargin_24 = 24.0;
  static final cMargin_10 = 10.0;
  static final cMarginTextField_15 = 15.0;
  static final cMarginTextField_30 = 30.0;
  static final cMarginTextField_16 = 16.0;

  // Radius size
  static final cCornerRadius_5 = 5.0;
  static final cCornerRadius_50 = 50.0;

  // Blur size
  static final cBlurRadius_10 = 10.0;

  // Icon size
  static final cIcon_30 = 30.0;


  // Network
  static final debounceTime = 500;
  static final pageSize = 20;
  static final String exampleUrl = 'https://jsonplaceholder.typicode.com';

  // Local storage
  static final acccesToken = 'acccesToken';
  static final otp = 'otp';

  //CHeight
  static final cHeight_10 = 10.0;
  static final cHeight_20 = 20.0;
  static final cHeight_40 = 40.0;
  static final cHeight_50 = 50.0;
  static final cHeight_60 = 60.0;
  static final cHeight_65 = 65.0;
  static final cHeight_70 = 70.0;



  //Message
  static final validPhoneNumberMsg = "Valid phone number";
  static final validOTPMsg = "valid";

  //Image
  static final imgResetPassSuccess = "assets/images/forgot-pass-success.png";
}
