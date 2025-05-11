import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_edit/shopping_sheet_delete_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_edit/shopping_sheet_edit_controller.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_edit/shopping_sheet_form_name_text_field.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingSheetEditScreen extends HookConsumerWidget {
  const ShoppingSheetEditScreen({required this.shoppingSheetId, super.key});

  final String shoppingSheetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingSheetAsyncValue = ref.watch(
      ShoppingSheetFutureProvider(shoppingSheetId),
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final titleController = useTextEditingController(
      text: shoppingSheetAsyncValue.value?.title,
      keys: [shoppingSheetAsyncValue.value?.title],
    );

    Future<void> save() async {
      unFocusAll();
      if (!(await formKey.validateAndScrollToInvalidField())) {
        return;
      }
      await ref
          .read(shoppingSheetEditControllerProvider.notifier)
          .updateShoppingSheetTitle(
            shoppingSheetId,
            titleController.text.trim(),
          );
      if (!context.mounted) {
        return;
      }

      ShoppingSheetRoute(shoppingSheetId: shoppingSheetId).go(context);
    }

    Future<void> delete() async {
      unFocusAll();
      final isConfirmed = await ShoppingSheetDeleteConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(shoppingSheetEditControllerProvider.notifier)
          .deleteShoppingSheet(shoppingSheetId);
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
          actions: [IconButton(icon: const Icon(Icons.check), onPressed: save)],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ShoppingSheetFormNameTextField(controller: titleController),
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
