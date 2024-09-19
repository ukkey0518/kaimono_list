import * as functions from 'firebase-functions'
import { AppState } from '../../app_state'

/**
 * Handles Firestore onWrite events for the shopping list.
 *
 * This function is triggered whenever a shopping list document is created, updated, or deleted.
 * It logs the event and synchronizes the shopping list with user shopping lists.
 *
 * @param appState - The application state containing services and configurations.
 * @param before - The snapshot of the document before the write event. Undefined if the document did not exist.
 * @param after - The snapshot of the document after the write event. Undefined if the document has been deleted.
 * @returns A promise that resolves when the handler has completed its operations.
 */
export async function onWriteShoppingListHandler(
  appState: AppState,
  before: functions.firestore.DocumentSnapshot | undefined,
  after: functions.firestore.DocumentSnapshot | undefined
): Promise<void> {
  if (before && after) {
    // TODO(Ukkey): Implement custom logger
    console.log(`Shopping list updated: ${before.id}`)
  } else if (!before && after) {
    // TODO(Ukkey): Implement custom logger
    console.log(`Shopping list created: ${after.id}`)
  } else if (before && !after) {
    // TODO(Ukkey): Implement custom logger
    console.log(`Shopping list deleted: ${before.id}`)
  } else {
    // TODO(Ukkey): Implement custom logger
    console.error(`Shopping list unknown event`)
    return
  }

  if (before) {
    // TODO(Ukkey): Implement custom logger
    console.log(`Syncing shopping list to user shopping lists: ${before.id}`)

    // If document was updated or deleted, sync the shopping list to user shopping lists
    await appState.shoppingListService.syncShoppingListUserShoppingLists(before.id)
  }
}
