// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$signInRoute, $homeRoute];

RouteBase get $signInRoute =>
    GoRouteData.$route(path: '/sign-in', factory: _$SignInRoute._fromState);

mixin _$SignInRoute on GoRouteData {
  static SignInRoute _fromState(GoRouterState state) =>
      SignInRoute(from: state.uri.queryParameters['from']);

  SignInRoute get _self => this as SignInRoute;

  @override
  String get location => GoRouteData.$location(
    '/sign-in',
    queryParams: {if (_self.from != null) 'from': _self.from},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',

  factory: _$HomeRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'shopping-list/:shoppingSheetId',

      factory: _$ShoppingSheetRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'edit',

          factory: _$ShoppingSheetEditRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'reorder',

          factory: _$ShoppingItemsReorderModalRoute._fromState,
        ),
      ],
    ),
  ],
);

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ShoppingSheetRoute on GoRouteData {
  static ShoppingSheetRoute _fromState(GoRouterState state) =>
      ShoppingSheetRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  ShoppingSheetRoute get _self => this as ShoppingSheetRoute;

  @override
  String get location => GoRouteData.$location(
    '/shopping-list/${Uri.encodeComponent(_self.shoppingSheetId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ShoppingSheetEditRoute on GoRouteData {
  static ShoppingSheetEditRoute _fromState(GoRouterState state) =>
      ShoppingSheetEditRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  ShoppingSheetEditRoute get _self => this as ShoppingSheetEditRoute;

  @override
  String get location => GoRouteData.$location(
    '/shopping-list/${Uri.encodeComponent(_self.shoppingSheetId)}/edit',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ShoppingItemsReorderModalRoute on GoRouteData {
  static ShoppingItemsReorderModalRoute _fromState(GoRouterState state) =>
      ShoppingItemsReorderModalRoute(
        shoppingSheetId: state.pathParameters['shoppingSheetId']!,
      );

  ShoppingItemsReorderModalRoute get _self =>
      this as ShoppingItemsReorderModalRoute;

  @override
  String get location => GoRouteData.$location(
    '/shopping-list/${Uri.encodeComponent(_self.shoppingSheetId)}/reorder',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
