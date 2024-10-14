import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/progress_indicator.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    required this.isLoading,
    required this.child,
    super.key,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) const _Wrapper(),
      ],
    );
  }
}

class ProgressBuilder extends StatelessWidget {
  const ProgressBuilder({
    required this.isLoading,
    required this.builder,
    super.key,
  });

  final bool isLoading;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: builder),
        if (isLoading) const _Wrapper(),
      ],
    );
  }
}

class _Wrapper extends StatelessWidget {
  const _Wrapper();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: ColoredBox(
        color: Colors.white30,
        child: Center(
          child: AppLoadingIndicator(),
        ),
      ),
    );
  }
}
