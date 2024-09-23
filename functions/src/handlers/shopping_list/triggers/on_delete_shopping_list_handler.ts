import * as functionsV2 from 'firebase-functions'
import { AppState } from '../../../app_state'

/**
 * Handles the deletion of a shopping list.
 *
 * This function is triggered when a shopping list document is deleted.
 * It ensures that the shopping list is removed from all users' data.
 *
 * @param appState - The current application state, which includes services and other app-wide data.
 * @param ds - The document snapshot of the shopping list that was deleted. If undefined, the function logs an error and returns.
 * @returns A promise that resolves when the shopping list has been successfully deleted from all users.
 */
export async function onDeleteShoppingListHandler(
  appState: AppState,
  event: functionsV2.firestore.FirestoreEvent<
    functionsV2.firestore.QueryDocumentSnapshot | undefined
  >
): Promise<void> {
  if (!event.data) {
    // TODO(Ukkey): Implement custom logger
    console.error('Shopping list document snapshot is undefined')
    return
  }

  const ds = event.data

  // Delete the shopping list from all users
  await appState.shoppingListService.deleteAllUsersShoppingLists(ds.id)
}
