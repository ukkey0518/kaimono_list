import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/home/presentation/components/welcome_badge.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/shopping_lists_navigation_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(Sizes.p64),
            WelcomeBadge(),
            Gap(Sizes.p24),
            Flexible(
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
