import 'package:algolab/algo_lab_theme.dart';
import 'package:algolab/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      builder: (context, child) =>  TapRegionSurface(child: child!),
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
