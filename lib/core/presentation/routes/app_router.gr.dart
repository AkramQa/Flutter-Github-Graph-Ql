// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CountryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CountryPage(),
      );
    }
  };
}

/// generated route for
/// [CountryPage]
class CountryRoute extends PageRouteInfo<void> {
  const CountryRoute({List<PageRouteInfo>? children})
      : super(
          CountryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
