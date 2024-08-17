import 'package:flutter/material.dart';
import 'package:kaimono_list/src/constants/sizes.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.dimension = Sizes.p16,
    this.color,
  });

  final double dimension;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 0.5,
      ),
    );
  }
}
