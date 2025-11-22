import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlgoLabTheme {
  static const Color primaryColor = Color(0xFF72C42B);

  static ThemeData get theme => ThemeData.from(
    colorScheme: ColorScheme.highContrastLight(primary: primaryColor),
  ).copyWith(
    textTheme: GoogleFonts.enriquetaTextTheme().copyWith(
      headlineSmall: GoogleFonts.sueEllenFrancisco(fontSize: 48),
      labelLarge: GoogleFonts.sueEllenFrancisco(fontSize: 28),
      titleLarge: GoogleFonts.sueEllenFrancisco(fontSize: 28),
    ),
    dialogTheme: DialogThemeData(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(64))
    ),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    )),
  );
}
