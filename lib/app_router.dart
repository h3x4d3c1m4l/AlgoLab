import 'package:algolab/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page, initial: true),
  ];

}
