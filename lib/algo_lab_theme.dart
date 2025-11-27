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
      bodyLarge: GoogleFonts.enriqueta(fontSize: 18),
      bodyMedium: GoogleFonts.enriqueta(fontSize: 16),
    ),
    cardTheme: CardThemeData(
      margin: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    ),
    dialogTheme: DialogThemeData(
      iconColor: primaryColor,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(64))
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    )),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    )),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
    )),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),
      ),
    ),
  );
}
