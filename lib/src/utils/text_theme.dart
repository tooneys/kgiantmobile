import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: Colors.black38,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.black38,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white60,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.white60,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
  );
}
