import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF000000), // Black as primary
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.archivoTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFFFFFF),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: GoogleFonts.archivoTextTheme(ThemeData.dark().textTheme),
    );
  }
}
