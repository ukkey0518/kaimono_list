import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/shopping_list_add/shopping_list_add_controller.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/components/shopping_list_form_name_text_field.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingListAddScreen extends HookConsumerWidget {
  const ShoppingListAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController();

    Future<void> save() async {
      unFocusAll();
      if (!(await formKey.validateAndScrollToInvalidField())) {
        return;
      }
      final newShoppingListId = await ref
          .read(shoppingListAddControllerProvider.notifier)
          .createNewShoppingList(
            nameController.text.trim(),
          );
      if (!context.mounted || newShoppingListId == null) {
        return;
      }

      ShoppingListRoute(shoppingListId: newShoppingListId).go(context);
    }

    return GestureDetector(
      onTap: unFocusAll,
      child: Scaffold(
        appBar: AppBar(
          title: Text('買い物リストの追加'.hardcoded),
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
                autofocus: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
