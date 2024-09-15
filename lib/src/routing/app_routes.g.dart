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
          path: 'shopping-list/:shoppingListId',
          factory: $ShoppingListRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'edit',
              factory: $ShoppingListEditRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'shopping-list-add',
          factory: $ShoppingListAddRouteExtension._fromState,
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

extension $ShoppingListRouteExtension on ShoppingListRoute {
  static ShoppingListRoute _fromState(GoRouterState state) => ShoppingListRoute(
        shoppingListId: state.pathParameters['shoppingListId']!,
      );

  String get location => GoRouteData.$location(
        '/shopping-list/${Uri.encodeComponent(shoppingListId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShoppingListEditRouteExtension on ShoppingListEditRoute {
  static ShoppingListEditRoute _fromState(GoRouterState state) =>
      ShoppingListEditRoute(
        shoppingListId: state.pathParameters['shoppingListId']!,
      );

  String get location => GoRouteData.$location(
        '/shopping-list/${Uri.encodeComponent(shoppingListId)}/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShoppingListAddRouteExtension on ShoppingListAddRoute {
  static ShoppingListAddRoute _fromState(GoRouterState state) =>
      const ShoppingListAddRoute();

  String get location => GoRouteData.$location(
        '/shopping-list-add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
