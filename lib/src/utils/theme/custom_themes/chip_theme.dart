import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KChipTheme {
  KChipTheme._();

  static ChipThemeData lightTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: GoogleFonts.montserrat().copyWith(color: Colors.black),
    selectedColor: Colors.deepPurple,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData darkTheme = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: GoogleFonts.montserrat().copyWith(color: Colors.white),
    selectedColor: Colors.deepPurple,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: Colors.white,
  );
}
