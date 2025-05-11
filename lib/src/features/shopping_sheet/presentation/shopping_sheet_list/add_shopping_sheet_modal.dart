import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class AddShoppingSheetModal extends HookWidget {
  const AddShoppingSheetModal._({super.key});

  static Future<String?> show(BuildContext context, {Key? key}) {
    return showDialog<String>(
      context: context,
      builder: (context) => AddShoppingSheetModal._(key: key),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final titleTextController = useTextEditingController();

    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text('新しい買い物リストを作成'),
        content: TextFormField(
          controller: titleTextController,
          validator: FormBuilderValidators.required(errorText: '必須入力です'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '買い物リスト名',
          ),
        ),
        actions: [
          TextButton(onPressed: context.pop, child: const Text('キャンセル')),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              context.pop(titleTextController.text.trim());
            },
            child: const Text('作成する'),
          ),
        ],
      ),
    );
  }
}
