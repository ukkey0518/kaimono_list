import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/add_shopping_list/add_shopping_list_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class AddShoppingListScreen extends HookConsumerWidget {
  const AddShoppingListScreen({super.key});

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
          .read(addShoppingListControllerProvider.notifier)
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
              TextFormField(
                controller: nameController,
                maxLength: ShoppingList.maxNameLength,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: '必須入力です'.hardcoded,
                  ),
                  FormBuilderValidators.maxLength(
                    ShoppingList.maxNameLength,
                    errorText:
                        '${ShoppingList.maxNameLength}文字以内で入力してください'.hardcoded,
                  ),
                ]),
                decoration: InputDecoration(
                  // TODO(Ukkey): Commonization of InputDecoration
                  border: const OutlineInputBorder(),
                  labelText: '買い物リスト名*'.hardcoded,
                ),
                autofocus: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
