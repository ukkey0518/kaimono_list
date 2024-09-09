import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/progress_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    required this.isProcessing,
    required this.child,
    super.key,
  });

  final bool isProcessing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isProcessing) const _Wrapper(),
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
