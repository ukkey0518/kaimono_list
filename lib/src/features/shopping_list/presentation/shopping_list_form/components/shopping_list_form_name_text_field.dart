import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingListFormNameTextField extends StatelessWidget {
  const ShoppingListFormNameTextField({
    required this.controller,
    this.autofocus = false,
    super.key,
  });

  final TextEditingController controller;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: ShoppingList.maxNameLength,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: '必須入力です'.hardcoded,
        ),
        FormBuilderValidators.maxLength(
          ShoppingList.maxNameLength,
          errorText: '${ShoppingList.maxNameLength}文字以内で入力してください'.hardcoded,
        ),
      ]),
      decoration: InputDecoration(
        // TODO(Ukkey): Commonization of InputDecoration
        border: const OutlineInputBorder(),
        labelText: '買い物リスト名*'.hardcoded,
      ),
      autofocus: autofocus,
    );
  }
}
