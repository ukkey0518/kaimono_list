import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../app_state'

/**
 * Handles the update event for a shopping list.
 *
 * This function is triggered when a shopping list document is updated. It synchronizes the updated shopping list to all users.
 *
 * @param appState - The current application state.
 * @param ds - The document snapshot of the updated shopping list. If undefined, an error is logged.
 * @returns A promise that resolves when the synchronization is complete.
 */
export async function onUpdateShoppingListHandler(
  appState: AppState,
  change: functionsV2.Change<FirebaseFirestore.QueryDocumentSnapshot> | undefined
): Promise<void> {
  if (!change) {
    // TODO(Ukkey): Implement custom logger
    console.error('Shopping list document snapshot is undefined')
    return
  }

  // TODO(UKkey): Add handling logic for when `.ownerUserId` is changed

  // Synchronize the shopping list to all users
  await appState.shoppingListService.syncAllUsersShoppingLists(change.after.id)
}
