import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../../app_state'
import { FirestoreSnapshotEvent } from '../../../constants/cloud_functions_types'

/**
 * Handles the creation of a shopping list in Firestore.
 *
 * This function is triggered when a new shopping list document is created in Firestore.
 * It creates a user shopping list for the owner of the shopping list.
 *
 * @param appState - The application state containing services and configurations.
 * @param event - The Firestore event containing the snapshot of the created document.
 */
export async function onCreateShoppingListHandler(
  appState: AppState,
  event: FirestoreSnapshotEvent
): Promise<void> {
  try {
    const ds = event.data
    if (!ds) {
      // TODO: Implement custom logger
      console.error('Shopping list document snapshot is undefined')
      return
    }

    // Create a user shopping list for the owner of the shopping list
    await appState.shoppingListService.createUserShoppingList(ds.id)
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
