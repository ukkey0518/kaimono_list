import { AppState } from '../../../app_state'
import { ShoppingListData } from '../../../models/shopping_list'

/**
 * Handles the creation of a new shopping list.
 *
 * This function is triggered when a new shopping list document is created in Firestore.
 * It creates a user shopping list for the owner of the shopping list.
 *
 * @param appState - The current application state, which includes services and other utilities.
 * @param ds - The Firestore document snapshot of the newly created shopping list.
 * @returns A promise that resolves when the user shopping list has been successfully created.
 */
export async function onCreateShoppingListHandler(
  appState: AppState,
  ds: FirebaseFirestore.QueryDocumentSnapshot | undefined
): Promise<void> {
  if (!ds) {
    // TODO(Ukkey): Implement custom logger
    console.error('Shopping list document snapshot is undefined')
    return
  }

  const shoppingList = ds.data() as ShoppingListData

  // Create a user shopping list for the owner of the shopping list
  await appState.shoppingListService.createUserShoppingList(shoppingList.ownerUserId, ds.id)
}
