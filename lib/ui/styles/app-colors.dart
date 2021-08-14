import 'package:flutter/material.dart';

class AppColors {
  static final Color white = Color(0xFFFFFFFF);
  static final Color grey2 = Color.fromARGB(154, 115, 115, 115);
  static final Color lightGrey = Color.fromARGB(255, 206, 206, 206);
  static final Color black = Color(0xFF514766);
  static final Color grey = Color(0xFF6E6680);

  // static final Color kPrimaryColor = Color(0xFF943734);
  static final Color  kPrimaryColor= Color(0xFF695D89);

  static const int _kPrimaryValue = 0xFF695D89;
  static const MaterialColor kPrimaryMaterialColor = MaterialColor(
    _kPrimaryValue,
    <int, Color>{
      50: Color.fromRGBO(105, 93, 137, .1),
      100: Color.fromRGBO(105, 93, 137, .2),
      200: Color.fromRGBO(105, 93, 137, .3),
      300: Color.fromRGBO(105, 93, 137, .4),
      400: Color.fromRGBO(105, 93, 137, .5),
      500: Color(_kPrimaryValue),
      600: Color.fromRGBO(105, 93, 137, .7),
      700: Color.fromRGBO(105, 93, 137, .8),
      800: Color.fromRGBO(105, 93, 137, .9),
      900: Color.fromRGBO(105, 93, 137, 1),
    },
  );

  static final Color kSecondaryColor = Color(0xFFC46865);
  static final Color kTextColor = Color.fromARGB(255, 25, 25, 25);
  static final Color kSecondaryTextColor = Color.fromARGB(255, 115, 115, 115);
  static final Color kInvoiceColor = Color.fromARGB(255, 38, 161, 221);
  static final Color kNextInvoiceColor = Color.fromARGB(255, 255, 120, 62);
  static final Color kLimitColor = Color.fromARGB(255, 35, 125, 70);
  static final Color kUnviewColor = Color.fromARGB(255, 245, 245, 245);
  static final Color kLineColor = Color.fromARGB(255, 204, 204, 204);
  static final Color kLabelButtonColor = Color.fromARGB(255, 240, 241, 245);

  //Greens
  static final Color darkGreen = Color(0xFF04D361);

  //Yellow
  static final Color yellow = Color(0xFFFDD835);


  //Reds
  static final Color darkRed = Color(0xFFCC3750);

  //LevelButton
  static final Color levelButtonFacil = Color(0xFFEBEBFC);
}
