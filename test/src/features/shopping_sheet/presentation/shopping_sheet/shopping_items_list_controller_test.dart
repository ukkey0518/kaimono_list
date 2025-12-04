import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_items_list_controller.dart';
import 'package:mocktail/mocktail.dart';

import '/Users/ukkey/Projects/ukkey0518/kaimono_list/test/src/features/shopping_sheet/data/shopping_item_repository_test.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const ShoppingItem());
  });

  group('ShoppingItemsListController', () {
    late ProviderContainer container;
    late MockShoppingItemRepository mockRepository;
    late String testShoppingSheetId;

    setUp(() {
      mockRepository = MockShoppingItemRepository();
      container = ProviderContainer(
        overrides: [
          shoppingItemRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      testShoppingSheetId = 'test-shopping-sheet-id';
    });

    tearDown(() {
      container.dispose();
    });

    group('build', () {
      test('初期状態はnullを返す', () async {
        await container.read(shoppingItemsListControllerProvider.future);
        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));
      });
    });

    group('createShoppingItem', () {
      test('新しいショッピングアイテムを作成できる', () async {
        when(
          () => mockRepository.create(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItem: any(named: 'shoppingItem'),
          ),
        ).thenAnswer((_) async => 'new-item-id');

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const shoppingItem = ShoppingItem(name: 'Test Item');

        await controller.createShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: shoppingItem,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.create(
            shoppingSheetId: testShoppingSheetId,
            shoppingItem: shoppingItem,
          ),
        ).called(1);
      });

      test('作成中はloading状態になる', () async {
        when(
          () => mockRepository.create(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItem: any(named: 'shoppingItem'),
          ),
        ).thenAnswer((_) async => 'new-item-id');

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const shoppingItem = ShoppingItem(name: 'Test Item');

        final future = controller.createShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: shoppingItem,
        );

        final loadingState = container.read(
          shoppingItemsListControllerProvider,
        );
        expect(loadingState, const AsyncValue<void>.loading());

        await future;

        final completedState = container.read(
          shoppingItemsListControllerProvider,
        );
        expect(completedState, const AsyncValue<void>.data(null));
      });

      test('エラーが発生した場合はerror状態になる', () async {
        when(
          () => mockRepository.create(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItem: any(named: 'shoppingItem'),
          ),
        ).thenThrow(Exception('create error'));

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const shoppingItem = ShoppingItem(name: 'Test Item');

        await controller.createShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: shoppingItem,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state.hasError, isTrue);
        expect(state.error, isA<Exception>());
      });
    });

    group('updateShoppingItemName', () {
      test('ショッピングアイテムの名前を更新できる', () async {
        when(
          () => mockRepository.updateName(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            name: any(named: 'name'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'test-item-id';
        const updatedName = 'Updated Name';

        await controller.updateShoppingItemName(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
          name: updatedName,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.updateName(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
            name: updatedName,
          ),
        ).called(1);
      });

      test('存在しないアイテムの名前を更新しようとするとエラーになる', () async {
        when(
          () => mockRepository.updateName(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            name: any(named: 'name'),
          ),
        ).thenThrow(Exception('updateName error'));

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );

        await controller.updateShoppingItemName(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: 'non-existent-item-id',
          name: 'New Name',
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state.hasError, isTrue);
        expect(state.error, isA<Exception>());
      });
    });

    group('saveShoppingItem', () {
      test('IDがないアイテムは新規作成される', () async {
        when(
          () => mockRepository.create(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItem: any(named: 'shoppingItem'),
          ),
        ).thenAnswer((_) async => 'new-item-id');

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const shoppingItem = ShoppingItem(name: 'New Item'); // IDなし

        await controller.saveShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: shoppingItem,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.create(
            shoppingSheetId: testShoppingSheetId,
            shoppingItem: shoppingItem,
          ),
        ).called(1);
        verifyNever(
          () => mockRepository.updateName(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            name: any(named: 'name'),
          ),
        );
      });

      test('IDがあるアイテムは名前が更新される', () async {
        when(
          () => mockRepository.updateName(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            name: any(named: 'name'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'existing-item-id';
        const updatedName = 'Updated Name';
        const existingItem = ShoppingItem(
          id: itemId,
          name: updatedName,
        );

        await controller.saveShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: existingItem,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.updateName(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
            name: updatedName,
          ),
        ).called(1);
        verifyNever(
          () => mockRepository.create(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItem: any(named: 'shoppingItem'),
          ),
        );
      });

      test('名前がnullの場合は空文字で更新される', () async {
        when(
          () => mockRepository.updateName(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            name: any(named: 'name'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'test-item-id';
        const shoppingItem = ShoppingItem(id: itemId);

        await controller.saveShoppingItem(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: shoppingItem,
        );

        verify(
          () => mockRepository.updateName(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
            name: '', // nullの場合は空文字で更新される
          ),
        ).called(1);
      });
    });

    group('updateShoppingItemIsCompleted', () {
      test('ショッピングアイテムの完了状態を更新できる', () async {
        when(
          () => mockRepository.updateIsCompleted(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            isCompleted: any(named: 'isCompleted'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'test-item-id';

        await controller.updateShoppingItemIsCompleted(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
          isCompleted: true,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.updateIsCompleted(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
            isCompleted: true,
          ),
        ).called(1);
      });

      test('完了状態をfalseに戻せる', () async {
        when(
          () => mockRepository.updateIsCompleted(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
            isCompleted: any(named: 'isCompleted'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'test-item-id';

        await controller.updateShoppingItemIsCompleted(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
          isCompleted: false,
        );

        verify(
          () => mockRepository.updateIsCompleted(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
            isCompleted: false,
          ),
        ).called(1);
      });
    });

    group('deleteShoppingItem', () {
      test('指定されたショッピングアイテムを削除できる', () async {
        when(
          () => mockRepository.delete(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );
        const itemId = 'test-item-id';

        await controller.deleteShoppingItem(
          testShoppingSheetId,
          itemId,
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.delete(
            shoppingSheetId: testShoppingSheetId,
            shoppingItemId: itemId,
          ),
        ).called(1);
      });

      test('存在しないアイテムを削除しようとするとエラーになる', () async {
        when(
          () => mockRepository.delete(
            shoppingSheetId: any(named: 'shoppingSheetId'),
            shoppingItemId: any(named: 'shoppingItemId'),
          ),
        ).thenThrow(Exception('delete error'));

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );

        await controller.deleteShoppingItem(
          testShoppingSheetId,
          'non-existent-item-id',
        );

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state.hasError, isTrue);
        expect(state.error, isA<Exception>());
      });
    });

    group('deleteAllPurchasedShoppingItems', () {
      test('完了済みのショッピングアイテムを一括削除できる', () async {
        when(
          () => mockRepository.deleteListCompleted(
            shoppingSheetId: any(named: 'shoppingSheetId'),
          ),
        ).thenAnswer((_) async {});

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );

        await controller.deleteAllPurchasedShoppingItems(testShoppingSheetId);

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state, const AsyncValue<void>.data(null));

        verify(
          () => mockRepository.deleteListCompleted(
            shoppingSheetId: testShoppingSheetId,
          ),
        ).called(1);
      });

      test('エラーが発生した場合はerror状態になる', () async {
        when(
          () => mockRepository.deleteListCompleted(
            shoppingSheetId: any(named: 'shoppingSheetId'),
          ),
        ).thenThrow(Exception('deleteListCompleted error'));

        final controller = container.read(
          shoppingItemsListControllerProvider.notifier,
        );

        await controller.deleteAllPurchasedShoppingItems(testShoppingSheetId);

        final state = container.read(shoppingItemsListControllerProvider);
        expect(state.hasError, isTrue);
        expect(state.error, isA<Exception>());
      });
    });
  });
}
