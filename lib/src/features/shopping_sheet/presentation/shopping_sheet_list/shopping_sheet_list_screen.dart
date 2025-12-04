import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/app_error_dialog.dart';
import 'package:kaimono_list/src/common_widgets/async_value_builder.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_out/sign_out_icon_button.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_list/add_shopping_sheet_modal.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_list/shopping_sheet_list_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/widget_ref_extensions.dart';
import 'package:kaimono_list/src/utils/snackbar.dart';

class ShoppingSheetListScreen extends ConsumerWidget {
  const ShoppingSheetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listenAsyncError(
        shoppingSheetsByUserFutureProvider,
        (e, s) => AppSnackbar.showError(context, e),
      )
      ..listenAsyncError(
        shoppingSheetListControllerProvider,
        (e, s) => AppErrorDialog.show(context, e),
      );

    Future<void> createNewSheet() async {
      final newSheetTitle = await AddShoppingSheetModal.show(context);
      if (newSheetTitle == null) {
        return;
      }

      final newShoppingSheetId = await ref
          .read(shoppingSheetListControllerProvider.notifier)
          .createShoppingSheet(title: newSheetTitle);
      if (newShoppingSheetId == null || !context.mounted) {
        return;
      }

      ShoppingSheetRoute(shoppingSheetId: newShoppingSheetId).go(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('おかいものリスト'),
        actions: [
          SignOutIconButton(
            onPressed: () => ref.read(authRepositoryProvider).signOut(),
          ),
        ],
      ),
      body: AsyncValueBuilder(
        asyncValue: ref.watch(shoppingSheetsByUserFutureProvider),
        onRetry: () => ref.invalidate(shoppingSheetsByUserFutureProvider),
        builder: (context, shoppingSheets) {
          return ListView(
            padding: const EdgeInsets.all(Sizes.p16),
            children: [
              for (final shoppingSheet in shoppingSheets)
                ListTile(
                  title: Text(shoppingSheet.title ?? ''),
                  onTap: () => ShoppingSheetRoute(
                    shoppingSheetId: shoppingSheet.id!,
                  ).go(context),
                ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('新しいリストを作成'),
                onTap: createNewSheet,
              ),
            ],
          );
        },
      ),
    );
  }
}
