import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class WelcomeBadge extends StatelessWidget {
  const WelcomeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Ukkey): Commonize the badge ui
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.shopping_cart,
            // TODO(Ukkey): Make it a constant
            size: 100,
          ),
          const Gap(Sizes.p16),
          Text(
            'Welcome to Kaimono List!'.hardcoded,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
