import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/components/shopping_list_form_name_text_field.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/shopping_list_edit/components/shopping_list_delete_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/shopping_list_edit/shopping_list_edit_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingListEditScreen extends HookConsumerWidget {
  const ShoppingListEditScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingListAsyncValue = ref.watch(
      shoppingListFutureProvider(
        shoppingListId,
      ),
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController(
      text: shoppingListAsyncValue.value?.name,
      keys: [shoppingListAsyncValue.value?.name],
    );

    Future<void> save() async {
      unFocusAll();
      if (!(await formKey.validateAndScrollToInvalidField())) {
        return;
      }
      await ref
          .read(shoppingListEditControllerProvider.notifier)
          .updateShoppingList(
            shoppingListId,
            nameController.text.trim(),
          );
      if (!context.mounted) {
        return;
      }

      ShoppingListRoute(shoppingListId: shoppingListId).go(context);
    }

    Future<void> delete() async {
      unFocusAll();
      final isConfirmed = await ShoppingListDeleteConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(shoppingListEditControllerProvider.notifier)
          .deleteShoppingList(
            shoppingListId,
          );
      if (!context.mounted) {
        return;
      }

      const HomeRoute().go(context);
    }

    return GestureDetector(
      onTap: unFocusAll,
      child: Scaffold(
        appBar: AppBar(
          title: Text('買い物リストの編集'.hardcoded),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: save,
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ShoppingListFormNameTextField(
                controller: nameController,
              ),
              const Gap(Sizes.p16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onError,
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: delete,
                  child: Text('削除する'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
