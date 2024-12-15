// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signInRoute,
      $homeRoute,
    ];

RouteBase get $signInRoute => GoRouteData.$route(
      path: '/sign-in',
      factory: $SignInRouteExtension._fromState,
    );

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => SignInRoute(
        from: state.uri.queryParameters['from'],
      );

  String get location => GoRouteData.$location(
        '/sign-in',
        queryParams: {
          if (from != null) 'from': from,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'shopping-list/:shoppingSheetId',
          factory: $ShoppingSheetRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'edit',
              factory: $ShoppingSheetEditRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'reorder',
              factory: $ShoppingItemsReorderModalRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShoppingSheetRouteExtension on ShoppingSheetRoute {
  static ShoppingSheetRoute _fromState(GoRouterState state) =>
      ShoppingSheetRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  String get location => GoRouteData.$location(
        '/shopping-list/${Uri.encodeComponent(shoppingSheetId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShoppingSheetEditRouteExtension on ShoppingSheetEditRoute {
  static ShoppingSheetEditRoute _fromState(GoRouterState state) =>
      ShoppingSheetEditRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  String get location => GoRouteData.$location(
        '/shopping-list/${Uri.encodeComponent(shoppingSheetId)}/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShoppingItemsReorderModalRouteExtension
    on ShoppingItemsReorderModalRoute {
  static ShoppingItemsReorderModalRoute _fromState(GoRouterState state) =>
      ShoppingItemsReorderModalRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  String get location => GoRouteData.$location(
        '/shopping-list/${Uri.encodeComponent(shoppingSheetId)}/reorder',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
