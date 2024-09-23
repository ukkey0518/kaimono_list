import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/big_icon_with_label.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_out/dialogs/sign_out_confirm_dialog.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_out/sign_out_controller.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_out/sign_out_icon_button.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/shopping_lists_navigation_list_view.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      signOutControllerProvider,
      (_, state) => state.showSnackbarOnError,
    );

    Future<void> signOut() async {
      final isConfirmed = await SignOutConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref.read(signOutControllerProvider.notifier).signOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          SignOutIconButton(
            onPressed: signOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BigIconWithLabel(
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(
                    'Welcome to Kaimono List!'.hardcoded,
                  ),
                ),
              ),
            ),
            const Gap(Sizes.p24),
            const Expanded(
              flex: 2,
              child: ShoppingListsNavigationListView(),
            ),
          ],
        ),
      ),
    );
  }
}
