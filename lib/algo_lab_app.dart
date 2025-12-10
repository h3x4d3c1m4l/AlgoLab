import 'package:algolab/algo_lab_theme.dart';
import 'package:algolab/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

class AlgoLabApp extends StatefulWidget {

  const AlgoLabApp({super.key});

  @override
  State<AlgoLabApp> createState() => _AlgoLabAppState();

}

class _AlgoLabAppState extends State<AlgoLabApp> {

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AlgoLab',
      theme: AlgoLabTheme.theme,
      routerConfig: _appRouter.config(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      builder: (context, child) => SketchyTheme(
        data: SketchyThemeData(
          inkColor: Colors.black38,
          paperColor: Colors.white,
          primaryColor: Colors.black,
          secondaryColor: Colors.white,
          errorColor: Colors.red,
          typography: SketchyTypographyData.comicShanns(),
          strokeWidth: 1, roughness: 0.5,
        ),
        child: TapRegionSurface(child: child!),
      ),
      supportedLocales: const [Locale('en'), Locale('nl')],
      locale: const Locale('en'),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

}
