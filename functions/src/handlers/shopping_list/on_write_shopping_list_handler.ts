import { AppState } from '../../app_state'

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
  ds: FirebaseFirestore.QueryDocumentSnapshot | undefined
): Promise<void> {
  if (!ds) {
    // TODO(Ukkey): Implement custom logger
    console.error('Shopping list document snapshot is undefined')
    return
  }

  // Delete the shopping list from all users
  await appState.shoppingListService.deleteShoppingListFromUsers(ds.id)
}
