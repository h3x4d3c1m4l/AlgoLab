import 'package:algolab/algo_lab_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(await PackageInfo.fromPlatform());

  // Preload fonts to avoid layout jumps.
  await GoogleFonts.pendingFonts([
    GoogleFonts.sueEllenFrancisco(),
    GoogleFonts.enriqueta(),
  ]);

  runApp(const AlgoLabApp());
}
