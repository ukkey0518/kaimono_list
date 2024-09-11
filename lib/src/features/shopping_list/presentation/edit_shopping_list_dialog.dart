import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class EditShoppingListDialog extends HookWidget {
  const EditShoppingListDialog({
    super.key,
    this.initialShoppingList,
  });

  final ShoppingList? initialShoppingList;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController(
      text: initialShoppingList?.name ?? '',
    );

    void submit() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      final newShoppingList = initialShoppingList?.copyWith(
            name: nameController.text.trim(),
          ) ??
          ShoppingList(
            name: nameController.text.trim(),
          );
      context.pop(newShoppingList);
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: AlertDialog(
        title: Text('新しい買い物リスト'.hardcoded),
        content: Form(
          key: formKey,
          child: TextFormField(
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
              label: Text('買い物リスト名*'.hardcoded),
              border: const OutlineInputBorder(),
            ),
            autofocus: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: Text('キャンセル'.hardcoded),
          ),
          TextButton(
            onPressed: submit,
            child: Text('作成'.hardcoded),
          ),
        ],
      ),
    );
  }
}
