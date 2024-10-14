import 'package:flutter/material.dart';
import 'package:kaimono_list/src/routing/app_router.dart';

/// A widget that provides access to an [AppRouterRef] within its subtree.
///
/// The [AppRouterRefScope] widget is used to scope the [AppRouterRef] to a
/// specific part of the widget tree. It allows descendant widgets to access
/// the [AppRouterRef] using the static methods [of], [maybeOf], and [refOf].
///
/// The [child] parameter is the widget that will be a descendant of this
/// [AppRouterRefScope].
///
/// Example usage:
/// ```dart
/// AppRouterRefScope(
///   child: MyChildWidget(),
/// );
/// ```
///
/// To access the [AppRouterRef] from a descendant widget:
/// ```dart
/// final appRouterRef = AppRouterRefScope.refOf(context);
/// ```
///
/// See also:
/// - [AppRouterRef]
/// - [AppRouterRefScopeState]
/// - [_InheritedAppRouterRef]
class AppRouterRefScope extends StatefulWidget {
  const AppRouterRefScope({
    required this.child,
    super.key,
  });

  static AppRouterRefScopeState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedAppRouterRef>()!
        .data;
  }

  static AppRouterRefScopeState? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedAppRouterRef>()
        ?.data;
  }

  static AppRouterRef refOf(BuildContext context) {
    return of(context).ref;
  }

  final Widget child;

  @override
  State<AppRouterRefScope> createState() => AppRouterRefScopeState();
}

/// A state class for `AppRouterRefScope` that manages the reference to
/// `AppRouterRef` and provides it to the widget tree through
/// `_InheritedAppRouterRef`.
///
/// This class extends `State<AppRouterRefScope>` and initializes the
/// `AppRouterRef` reference. It also builds the widget tree by wrapping
/// the child widget with `_InheritedAppRouterRef` to pass down the
/// `AppRouterRef` data.
class AppRouterRefScopeState extends State<AppRouterRefScope> {
  late AppRouterRef ref;

  @override
  Widget build(BuildContext context) {
    return _InheritedAppRouterRef(
      data: this,
      child: widget.child,
    );
  }
}

/// An inherited widget that holds a reference to the [AppRouterRefScopeState].
///
/// This widget is used to provide the [AppRouterRefScopeState] to its descendants
/// in the widget tree. It extends [InheritedWidget] and overrides the
/// [updateShouldNotify] method to always return false, indicating that
/// dependents do not need to be rebuilt when the widget updates.
///
/// The [data] parameter is required and holds the [AppRouterRefScopeState]
/// instance, while the [child] parameter is the widget below this widget
/// in the tree.
class _InheritedAppRouterRef extends InheritedWidget {
  const _InheritedAppRouterRef({
    required this.data,
    required super.child,
  });

  final AppRouterRefScopeState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
