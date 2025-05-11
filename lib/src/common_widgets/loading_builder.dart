import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/loading_indicator.dart';

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({
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
        if (isLoading) const _LoadingWrapper(),
      ],
    );
  }
}

class _LoadingWrapper extends StatelessWidget {
  const _LoadingWrapper();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: ColoredBox(
        color: Colors.white30,
        child: Center(child: LoadingIndicator()),
      ),
    );
  }
}
