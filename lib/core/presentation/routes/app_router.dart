import 'package:auto_route/auto_route.dart';

import '../../../features/task/presntation/pages/country_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: CountryRoute.page,
        path: CountryPage.routePath,
        initial: true),


  ];
}