// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $itemListRoute,
    ];

RouteBase get $itemListRoute => GoRouteData.$route(
      path: '/',
      name: 'itemList',
      factory: $ItemListRouteExtension._fromState,
    );

extension $ItemListRouteExtension on ItemListRoute {
  static ItemListRoute _fromState(GoRouterState state) => const ItemListRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
