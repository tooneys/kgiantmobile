import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static AppBarTheme lightTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: GoogleFonts.montserrat().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static AppBarTheme darkTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: GoogleFonts.montserrat().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
