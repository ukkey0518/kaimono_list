import * as functionsV2 from 'firebase-functions'
import { AppState } from '../../../app_state'
import { FirestoreSnapshotEvent } from '../../../constants/cloud_functions_types'

/**
 * Handles the deletion of a shopping list document from Firestore.
 *
 * This function is triggered when a shopping list document is deleted.
 * It ensures that the shopping list is removed from all users' lists.
 *
 * @param appState - The application state containing services and configurations.
 * @param event - The Firestore snapshot event containing the data of the deleted document.
 * @returns A promise that resolves when the deletion process is complete.
 */
export async function onDeleteShoppingListHandler(
  appState: AppState,
  event: FirestoreSnapshotEvent
): Promise<void> {
  try {
    if (!event.data) {
      // TODO: Implement custom logger
      console.error('Shopping list document snapshot is undefined')
      return
    }

    const ds = event.data

    // Delete the shopping list from all users
    await appState.shoppingListService.deleteAllUsersShoppingLists(ds.id)
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
