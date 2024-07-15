// backgroundColor: const Color(0xFF25366C),
import 'package:flutter/material.dart';

const kcPrimarySwatch = MaterialColor(0xff8BC83F, {
  50: Color(0xffF3FBEA),
  100: Color(0xffF5F4F9),
  200: Color(0xffF5F4F8),
  300: Color(0xff9FCE66),
  400: Color(0xff77B529),
  500: Color(0xffA7E6A9),
  600: Color(0xff7AAC3B),
  700: Color(0xff77B529),
  800: Color(0xff3FC845),
  900: Color(0xff356000),
});

// const kcAccentColorSwatch = MaterialColor(0xff1E81B0, {
//   50: Color(0xff1E81A1),
//   100: Color(0xff1E81A2),
//   200: Color(0xff1E81A3),
//   300: Color(0xff1E81A4),
//   400: Color(0xff1E81A5),
//   500: Color(0xff1E81A6),
//   600: Color(0xff1E81A7),
//   700: Color(0xff1E81A8),
//   800: Color(0xff1E81A9),
//   900: Color(0xff1E81A0),
// });

const kcPrimary = Color(0xff8BC83F);
const kcPrimaryLight = Color(0xffA7E6A9);
const kcAccent = Color(0xff234F68);
const kcAccentLigh = Color(0xffBCC9D2);

/////////////////////////////////////
const Color kGrey = Color(0xffFCFCFC);
const Color kcGreyDark = Color(0xff868686);
const Color kcGreyLightDark = Color(0xff9E9E9E);
const Color kcGreyLight = Color(0xffe5e5e5);
const Color kcGreyVeryLight = Color(0xFFF5F5F5);
//#F5F4F8

final lightTheme = ThemeData(
  fontFamily: 'Changa',
  iconTheme: const IconThemeData(
    size: 24.0,
    color: Colors.black87,
  ),
  splashColor: kcPrimarySwatch[500],
  useMaterial3: false,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    alignment: Alignment.center,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: kcPrimary,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: kcPrimary,
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      return kcPrimary;
    },
    //   style: ButtonStyle(iconColor: MaterialStateProperty.resolveWith<Color?>(
    // (Set<MaterialState> states) {
    //   if (states.contains(MaterialState.pressed)) {
    //     return kcPrimary;
    //   }
    //   return kcAccent; // Use the component's default.
    // },
  ))),
  hoverColor: const Color.fromARGB(255, 212, 212, 212),
  indicatorColor: Colors.white,
  dividerColor: Colors.grey,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: kcAccent),
    displayMedium: TextStyle(color: kcAccent),
    bodyMedium: TextStyle(color: kcAccent),
    titleMedium: TextStyle(color: kcAccent),
    bodyLarge: TextStyle(color: kcAccent),
    displaySmall: TextStyle(color: kcAccent), //kcBlack54
    headlineMedium: TextStyle(color: kcAccent),
    headlineSmall: TextStyle(color: kcAccent),

    titleLarge: TextStyle(color: kcAccent, fontWeight: FontWeight.normal),
  ),
);
