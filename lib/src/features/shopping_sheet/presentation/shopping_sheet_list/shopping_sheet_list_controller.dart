import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_sheet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_sheet_list_controller.g.dart';

@Riverpod(
  dependencies: [
    currentUserStream,
    shoppingSheetRepository,
  ],
)
class ShoppingSheetListController extends _$ShoppingSheetListController {
  @override
  FutureOr<void> build() async => null;

  Future<String?> createShoppingSheet({
    required String title,
  }) async {
    String? newShoppingSheetId;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentUser = await ref.read(currentUserStreamProvider.future);
      if (currentUser == null) {
        throw Exception('User is not authenticated');
      }

      final newShoppingSheet = ShoppingSheet(
        title: title,
        ownerUserId: currentUser.id,
      );

      final shoppingSheetRepository = ref.read(shoppingSheetRepositoryProvider);
      newShoppingSheetId = await shoppingSheetRepository.create(
        shoppingSheet: newShoppingSheet,
      );
    });
    return newShoppingSheetId;
  }
}
