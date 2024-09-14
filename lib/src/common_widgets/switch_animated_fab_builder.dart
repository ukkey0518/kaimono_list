import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// This widget provides an animation for switching the FAB.
///
/// This animation follows the guidelines of Material Design:
///
/// > When tabs are present, the FAB should briefly disappear,
/// > then reappear when the new content moves into place.
/// > This shows that the FAB is not connected to any particular
/// > tab or destination.
/// > https://m3.material.io/components/floating-action-button/guidelines#4dd3a071-5250-4b4b-97b8-78c7ca9e808f
///
/// This widget plays the animation on the initial render and does not replay it
/// when the parent widget rebuilds.
/// You can trigger the animation by changing the key and rebuilding the widget.
///
/// Example usage:
///
/// ```dart
/// SwitchAnimatedFabBuilder(
///   key: ValueKey(currentIndex),
///   builder: (context, child) {
///     return FloatingActionButton(
///       onPressed: () {},
///       child: child,
///     );
///   },
///   child: const Icon(Icons.add),
/// )
/// ```
class SwitchAnimatedFabBuilder extends HookWidget {
  const SwitchAnimatedFabBuilder({
    required this.builder,
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 300),
  });

  // Animation duration
  // The default duration is 300 milliseconds.
  final Duration duration;

  // Builder function to construct the FAB
  // This builder takes context and the child with opacity animation
  // as arguments.
  final Widget Function(BuildContext, Widget) builder;

  // The child of the FAB
  // This widget applies opacity animation.
  // While the FAB is scaling down, the child fades out,
  // and while the FAB is scaling up, the child fades in.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: duration,
    );

    Animation<double> createSwitchAnimation({
      required double begin,
      required double end,
    }) {
      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: end,
            end: begin,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
          weight: 3,
        ),
      ]).animate(animationController);
    }

    // An animation that scales from 1 to 0.5 in 1/4 of the animationController's duration,
    // and then scales back from 0.5 to 1 in 3/4 of the duration.
    final scaleAnimation = createSwitchAnimation(
      begin: 1,
      end: 0.5,
    );

    // An animation that fades from 1 to 0 in 1/4 of the animationController's duration,
    // and then fades back from 0 to 1 in 3/4 of the duration.
    final fadeAnimation = createSwitchAnimation(
      begin: 1,
      end: 0,
    );

    useEffect(
      () {
        animationController.forward();
        return null;
      },
      [],
    );

    return ScaleTransition(
      scale: scaleAnimation,
      alignment: Alignment.bottomRight,
      child: builder(
        context,
        FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      ),
    );
  }
}
