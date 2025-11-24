import 'package:algolab/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page, initial: true),
    if (kDebugMode) AutoRoute(page: DebugRoute.page),
    AutoRoute(page: SortingPracticeRoute.page),
  ];

}
