import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/sizes.dart';

class BigIconWithLabel extends StatelessWidget {
  const BigIconWithLabel({
    required this.icon,
    required this.label,
    super.key,
  });

  final Widget icon;
  final Text label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme(
          data: const IconThemeData(size: 100),
          child: icon,
        ),
        const Gap(Sizes.p16),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineMedium!,
          child: label,
        ),
      ],
    );
  }
}
