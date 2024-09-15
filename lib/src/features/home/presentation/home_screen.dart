import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/common_widgets/big_icon_with_label.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/shopping_lists_navigation_list_view.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(Sizes.p64),
            BigIconWithLabel(
              icon: const Icon(Icons.shopping_cart),
              label: Text(
                'Welcome to Kaimono List!'.hardcoded,
              ),
            ),
            const Gap(Sizes.p24),
            const Flexible(
              child: ShoppingListsNavigationListView(
                shrinkWrap: true,
                physics: RangeMaintainingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
