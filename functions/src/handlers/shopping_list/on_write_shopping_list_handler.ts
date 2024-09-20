import { AppState } from '../../app_state'

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
